/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.umariana.expocanina;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import static jdk.jpackage.internal.Arguments.CLIOptions.context;

/**
 *
 * @author DANIEL REVELO
 */
public class exposicion {
    
    public static ArrayList<Perro> misPerros = new ArrayList<>();
    
       public static ArrayList<Perro>  CargarPerro (ServletContext servletContext) throws FileNotFoundException, IOException {
        
        //Reutilizamos la ruta previamente definida para perro.ser
        String ruta = "/data/datosPerro.txt";
        String rutraApstracta = servletContext.getRealPath(ruta);
        
        File rutArchivo = new File(rutraApstracta);
        
        
        try {
            // Cargar la lista de perros desde el archivo
            FileInputStream archivo = new FileInputStream(rutArchivo);
            ObjectInputStream cargado = new ObjectInputStream(archivo);
            misPerros = (ArrayList<Perro>) cargado.readObject();
            cargado.close();
            System.out.println("Datos de perros cargados exitosamente "+ cargado);
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Error al cargar los datos de perros: " + e.getMessage());
        }
        return misPerros;
       
        
        //String ordenamiento = request.getParameter("ordenamiento");

       // if ("alfabetico".equals(ordenamiento)) {
           // misPerros.sort((p1, p2) -> p1.getNombre().compareTo(p2.getNombre()));
        //}

        

        
    }
    
    public static void GuardarPerro (ArrayList<Perro> perroGuardar,ServletContext servletContext) throws FileNotFoundException, IOException {
       //Definimos una ruta para buscar nuestro archivo perro.ser
        String relativePath = "/data/datosPerro.txt";
        String absPath = servletContext.getRealPath(relativePath);
        File archivo = new File(absPath);
        
        try {
            // Crear un archivo para guardar la lista de perros serializada
            FileOutputStream cargar = new FileOutputStream(archivo);
            ObjectOutputStream caragado = new ObjectOutputStream(cargar);
            Object perros = null;
            caragado.writeObject(perros);
            caragado.close();
            System.out.println("Datos de perros guardados exitosamente en: perros.ser"+ relativePath);
            
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Error al guardar los datos de perro: " + e.getMessage());
        }
    }


    private Object getServletContext() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
