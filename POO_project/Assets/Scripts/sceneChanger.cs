﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class sceneChanger : MonoBehaviour
{ 
    private void OnTriggerEnter2D(Collider2D collision)
    {
        SceneManager.LoadScene("Scene2");
        Debug.Log("pressed");
    }
}
