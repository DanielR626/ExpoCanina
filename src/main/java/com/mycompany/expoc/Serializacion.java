/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.expoc;

import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import javax.servlet.ServletContext;


public class Serializacion {

    
    public static void escribeArchivo(ArrayList<Perro> misPerros, ServletContext context) throws FileNotFoundException, IOException {
        String rutaRelativa = "/data/perrosAgregados.ser";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);

        
        try (FileOutputStream fos = new FileOutputStream(archivo); ObjectOutputStream oos = new ObjectOutputStream(fos)) {


            for (Perro perro : misPerros) {
                oos.writeObject(perro);
            }
        } catch (IOException e) {
            System.out.println("Error a escribir el archivo");
        }
    }

    /**
     * Lee datos serializados desde un archivo y los agrega a la lista.
     */
    public static void leeArchivo(ArrayList<Perro> misPerros, ServletContext context) throws IOException, ClassNotFoundException {

        String rutaRelativa = "/data/perrosAgregados.ser";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);


        if (archivo.length() == 0) {
            System.out.println("El archivo está vacío, no realizará lectura.");
            
            return; 
        }

        try (FileInputStream fis = new FileInputStream(archivo); ObjectInputStream ois = new ObjectInputStream(fis)) {

            
            misPerros.clear();

            while (true) {
                try {
                    
                    // Leer un objeto Perro del archivo
                    Perro perro = (Perro) ois.readObject();

                    
                    // Agregar el objeto Perro a la lista
                    misPerros.add(perro);
                } catch (EOFException e) {
                    

                    break;
                }
            }
        } catch (IOException e) {
            System.out.println("Error a leer el archivo");
        }
    }
    
    
}

