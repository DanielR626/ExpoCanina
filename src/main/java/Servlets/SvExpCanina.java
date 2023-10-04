/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servlets;

import com.mycompany.expoc.Perro;
import com.mycompany.expoc.Serializacion;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet(name = "SvExpCanina", urlPatterns = {"/SvExpCanina"})
public class SvExpCanina extends HttpServlet {

    
   ArrayList<Perro> misPerros = new ArrayList<>();
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
            
    {
        
        response.setContentType("text/html;charset=UTF-8");
        
    }
    
    public void init() throws ServletException{        
    }
    
    
    private Perro buscarConNombre (String nombre){
        
        for ( Perro perro : misPerros){
            if (perro.getNombre().equals(nombre)){
                return perro;
            }
        }
        
        return null;
    }
    
    
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Obtener la sesion actual
        HttpSession session = request.getSession();
        
        //Obtener el servlet
        ServletContext context = getServletContext();

        //Crear una lista para almacenar
        ArrayList<Perro> misPerros = new ArrayList<>();
        
        try {
            Serializacion.leeArchivo(misPerros, context);
        } catch (ClassNotFoundException ex) {
            
            Logger.getLogger(SvExpCanina.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Obtener datos del formulario
        String nombre = request.getParameter("nombre");
        String raza = request.getParameter("raza");
        
        //Obtener la parte del archivo de imagen
        Part filePart = request.getPart("imagen");
        
        
        String puntos = request.getParameter("puntos");
        String edad = request.getParameter("edad");

        
        
        String uploadPath = context.getRealPath("/imgPerros");

        
        // Obtener el nombre del archivo de imagen enviado
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        
        
        String filePath = uploadPath + File.separator + fileName;

        
        //Abrir un flujo de entrada 
        try (InputStream fileContent = filePart.getInputStream(); 
            FileOutputStream outputStream = new FileOutputStream(filePath)) {

            int read;
            byte[] buffer = new byte[1024];
            
            //Leer el archivo de imagen y escribirlo en el servidor
            while ((read = fileContent.read(buffer)) != -1) {
                outputStream.write(buffer, 0, read);
            }
        }

        
        // Crear un objeto Perro con los datos ingresados y el nombre del archivo de imagen
        Perro perro = new Perro(nombre, raza, fileName, Integer.parseInt(puntos), Integer.parseInt(edad));
        
        
        //Agregar el objeto Perro a la lista de los perros
        misPerros.add(perro);
        
        
        //Guardar la lista actualizada
        Serializacion.escribeArchivo(misPerros, context);

        
         // Agregar la lista completa de perros como atributo en la sesión
        session.setAttribute("misPerros", misPerros);

        
        // Redireccionar a la página destino
        response.sendRedirect("index.jsp");
        
        
    }
    

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
