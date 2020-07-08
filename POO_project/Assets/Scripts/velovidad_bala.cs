using System.Collections;
using System.Collections.Generic;
using System.Timers;
using UnityEngine;

public class velovidad_bala : MonoBehaviour
{
    private Rigidbody2D rig;
    public float speed;
    public GameObject tomar;
    public float tiempo;

   // public Transform manza;

    // Start is called before the first frame update
    private void Awake()
    {
        rig = GetComponent<Rigidbody2D>();
        tomar = GetComponent<GameObject>();
    }
    void Start()
    {
        rig.velocity = transform.right*speed;
        
    }

    // Update is called once per frame
    void Update()
    {

        tiempo -= 1 * Time.deltaTime;
        if (tiempo < 0) 
        {
            Destroy(gameObject);
        }

    }
}
