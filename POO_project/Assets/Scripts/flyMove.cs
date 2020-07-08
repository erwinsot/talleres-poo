using System.Collections;
using System.Collections.Generic;
using System.Threading;
using UnityEngine;

public class flyMove : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        gameObject.transform.Translate(-5f * Time.deltaTime, 0, 0);
    }
}
