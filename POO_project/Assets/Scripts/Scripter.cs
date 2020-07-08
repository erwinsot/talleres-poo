using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Scripter : MonoBehaviour
{
    public void menu(string nombre)
    {
        Debug.Log("cambiando a " + nombre);
        SceneManager.LoadScene(nombre);
    }
    public void salir()
    {
        Debug.Log("saliendo");
        Application.Quit();
    }
}
