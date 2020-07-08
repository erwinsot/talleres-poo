using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using UnityEngine;

public class playerMove : MonoBehaviour
{
    bool canJump;
   
    void Start()
    {
        
    }

    void Update()
    {
        move();
        manageJump();
    }

    void move() {
        if (Input.GetKey("left"))
        {
            gameObject.GetComponent<Rigidbody2D>().AddForce(new Vector2(-1000f * Time.deltaTime, 0));
        }
        if (Input.GetKey("right"))
        {
                gameObject.GetComponent<Rigidbody2D>().AddForce(new Vector2(1000f * Time.deltaTime, 0));
        }
    }
    void manageJump()
    {
        if (Input.GetKeyDown("up") && canJump)
        {
            canJump = false;
            gameObject.GetComponent<Rigidbody2D>().AddForce(new Vector2(0,700f));
        }
    }

    private void OnCollisionEnter2D(Collision2D collision) 
    {
        if (collision.transform.tag == "ground")
        {
            canJump = true;
        }
    }

}

