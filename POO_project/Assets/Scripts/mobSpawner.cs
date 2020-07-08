
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class mobSpawner : MonoBehaviour
{
    float timer;
    float x;
    public GameObject mobPrefab;

    void Update()
    {
        timer += Time.deltaTime;
        if (timer >= 5f)
        {
            timer = 0;
            float x = Random.Range(-40,60);
            Vector3 position = new Vector3(x, 30, 0);
            Quaternion rotation = new Quaternion();
            Instantiate(mobPrefab, position, rotation);
        }
    }
}
