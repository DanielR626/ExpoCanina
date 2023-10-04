/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import com.umariana.expocanina.Perro;
import com.umariana.expocanina.exposicion;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.imageio.stream.FileImageOutputStream;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.tools.FileObject;

/**
 *
 * @author PC
 */
@WebServlet("/SvPerros")
@MultipartConfig

public class SvPerros extends HttpServlet {
    ArrayList<Perro> misPerros = new ArrayList<>();
    
    
    
    protected void goGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
    } 
    
    
    
    
    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        
        Part imagenPart = request.getPart("foto");
        System.out.println("fotoPart" + imagenPart);
        
        String fileName = imagenPart.getSubmittedFileName();
        System.out.println("fileName" + fileName);
        
        String uploadDirectory = getServletContext().getRealPath("img");
        System.out.println("uploadDirectory: " + uploadDirectory);

        //Ruta completa del archivo
        String filePath = uploadDirectory + File.separator + fileName;
        System.out.println("filePath: " + filePath);

        //Guardar el archivo en el sistemaa de archivos
        try (InputStream input = imagenPart.getInputStream(); OutputStream output = new FileOutputStream(filePath)) {

            byte[] buffer = new byte[1024];
            int length;
            while ((length = input.read(buffer)) > 0) {
                output.write(buffer, 0, length);
            }
        }
        
        
        String nombre = request.getParameter("nombre");
        String raza = request.getParameter("raza");
        String foto = fileName;
        String puntos = request.getParameter("puntos");
        String edad = request.getParameter("edad");
       
        ServletContext servletContext=getServletContext();
       
        misPerros= exposicion.CargarPerro(servletContext);
        
        Perro miPerro = new Perro (nombre, raza, foto, Integer.parseInt(puntos), Integer.parseInt(edad));
        
        misPerros.add(miPerro);
        
        
        
        exposicion.GuardarPerro(misPerros, servletContext);
        

     
        request.setAttribute("ListaEnviada", misPerros);

        RequestDispatcher dispatcher = request.getRequestDispatcher("agregarCanino.jsp");
        dispatcher.forward(request, response);
        
        
    }


 
            
}

