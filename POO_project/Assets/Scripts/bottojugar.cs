using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class bottojugar : MonoBehaviour
{
  
    private void OnMouseDown()
    {
        SceneManager.LoadScene("zombieScene");
    }
}
