using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class seguir_cu : MonoBehaviour
{
    public Transform cubo;
    public int separar;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    private void FixedUpdate()
    {
        transform.position = new Vector3(cubo.position.x+separar, cubo.transform.position.y, transform.position.z);
    }
}
