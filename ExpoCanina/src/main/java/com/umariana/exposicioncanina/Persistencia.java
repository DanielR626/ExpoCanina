package com.umariana.exposicionCanina;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.http.Part;

/**
 *
 * @author Daniel Revelo
 */
public class Persistencia
{


   public static void escritura(ArrayList<Perro> misPerros, ServletContext context)
           throws FileNotFoundException, IOException 
   {
        
        String rutaRelativa = "/data/archivo.dat";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);

        try 
            (FileOutputStream fos = new FileOutputStream(archivo); ObjectOutputStream oos = new ObjectOutputStream(fos))
        {
            for (Perro perro : misPerros)
            {
                oos.writeObject(perro);
            }
        }
        catch (IOException e) 
        {
          
            System.out.println("ARCHIVO NO ENCONTRADO");
        }
    }


    public static void lectura(ArrayList<Perro> misPerros, ServletContext context) throws IOException, ClassNotFoundException {
        
        String rutaRelativa = "/data/archivo.dat";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);

        if (archivo.length() == 0)
        {
            System.out.println("Sin informacion que mostrar");
            return;
        }        
        try (FileInputStream fis = new FileInputStream(archivo); ObjectInputStream ois = new ObjectInputStream(fis)) 
        {
           
            misPerros.clear();
            while (true)
            {
                try 
                {                    
                   
                    Perro perro = (Perro) ois.readObject();                   
                    misPerros.add(perro);
                } catch (EOFException e) 
                {                    
                    break;
                }
            }
        } catch (IOException e)
        {
           
            System.out.println("EL ARCHIVO NO FUE LEIDO");
        }
    }   
    public static Perro buscarPorNombrePerrito(String nombre) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}

