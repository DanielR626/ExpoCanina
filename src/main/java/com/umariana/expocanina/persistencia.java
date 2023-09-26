/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.umariana.expocanina;

import java.io.EOFException;
import java.io.IOException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import javax.servlet.ServletContext;


public class persistencia
{
   public static void escritura(ArrayList<Perro> misPerros, ServletContext context)
           throws FileNotFoundException, IOException 
   {
        // Ruta relativa y absoluta del archivo de datos serializados
        String rutaRelativa = "/data/perroArchivo.ser";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);

        try (FileOutputStream fos = new FileOutputStream(archivo); ObjectOutputStream oos = new ObjectOutputStream(fos)) {
            for (Perro perro : misPerros) {
                oos.writeObject(perro);
            }
        } catch (IOException e) {
            System.out.println("Error al escribir el archivo de datos.");
        }
    }
    public static void lectura(ArrayList<Perro> misPerros, ServletContext context) throws IOException, ClassNotFoundException {
        String rutaRelativa = "/data/perroArchivo.ser";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);

        // Verificar si el archivo está vacío antes de intentar leerlo
        if (archivo.length() == 0) {
            System.out.println("El archivo está vacío, no se realizará la lectura.");
            return; // Salir del método sin realizar la lectura
        }

        try (FileInputStream fis = new FileInputStream(archivo); ObjectInputStream ois = new ObjectInputStream(fis)) {

            // Limpiar la lista actual antes de agregar nuevos elementos
            misPerros.clear();

            while (true) {
                try {
                    // Leer un objeto Perro del archivo
                    Perro perro = (Perro) ois.readObject();

                    // Agregar el objeto Perro a la lista
                    misPerros.add(perro);
                } catch (EOFException e) {
                    // Se alcanzó el final del archivo
                    break;
                }
            }
        } catch (IOException e) {
            System.out.println("Error al leer el archivo de datos.");
        }
    }
}
