using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class tiempo : MonoBehaviour
{
    float segundos;
    float minutos=0;
    public TextMesh textos;
    public TextMesh textos2;
    public GameObject marcador;
    // Start is called before the first frame update
    void Start()
    {
        
    }
    void actualizar()
    {
        textos.text = segundos.ToString("00");
        textos2.text = minutos.ToString("00"+":");

        if (segundos == 60) 
        {
            minutos += 1;
            segundos = 0;
        }
    }
    // Update is called once per frame
    void Update()
    {
        if (marcador.activeSelf == false)
        {
            segundos += 1 * Time.deltaTime;
            actualizar();
        }
    }
}
