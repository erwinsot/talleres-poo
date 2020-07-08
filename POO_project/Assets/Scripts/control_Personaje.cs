using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class control_Personaje : MonoBehaviour
{
    public float salto;
    public bool insuelo = true;
    public Transform comprobador_suelo;
    public Transform comprobador_trampa;
    public float radio;
    public LayerMask suelo;
    bool doblesalto=false;
    private Animator anima;
    public bool corriendo=false;
    public float velocidad;
    public bool enemigos=false;
    public LayerMask zombie;
    public GameObject camara;
    public GameObject camara2;
    private void Awake()
    {
        anima = GetComponent<Animator>();
    }
    // Start is called before the first frame update
    void Start()
    {
        
    }
    private void FixedUpdate()
    {
        //enemigos= Physics2D.OverlapCircle(comprobador_trampa.position, radio, zombie);
        if (enemigos) 
        {
            corriendo = false;
            camara.SetActive(true);
            

        }
        if (corriendo) 
        {
            GetComponent<Rigidbody2D>().velocity = new Vector2(velocidad, GetComponent<Rigidbody2D>().velocity.y);
            if (Input.GetKey("left"))
            {
                transform.rotation = Quaternion.Euler(0, 180, 0);
                velocidad = velocidad * -1;
            }
            else if (Input.GetKey("right"))
            {
                transform.rotation = Quaternion.Euler(0, 0, 0);
                velocidad = velocidad*-1 ;

            }
        }
        
        insuelo = Physics2D.OverlapCircle(comprobador_suelo.position, radio, suelo);
        anima.SetBool("insuelo", insuelo);
        anima.SetBool("corriendo", corriendo);
        anima.SetBool("enemys", enemigos);
        if (insuelo) {
            doblesalto = false;            
        }
    }

    // Update is called once per frame
    void Update()
    {

        if (Input.GetMouseButtonDown(0)) 
        {
            if (corriendo)
            {               
                if ((insuelo || !doblesalto))
                {
                    GetComponent<Rigidbody2D>().AddForce(new Vector2(0, salto));
                    if (!doblesalto && !insuelo)
                    {
                        doblesalto = true;
                    }
                }

            }
            else 
            {
                corriendo = true;
            }
        }
        
         
    }
    private void OnTriggerEnter2D(Collider2D collision)
    {
        if (collision.tag=="enemys" )
        {
            enemigos = true;
        }
        if (collision.tag == "winner") 
        {
            corriendo = false;
            camara2.SetActive(true);
        }
    }

}
