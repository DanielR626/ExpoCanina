package servlets;

import com.umariana.exposicionCanina.Perro;
import com.umariana.exposicionCanina.Persistencia;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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

/**
 *
 * @author Daniel Revelo
 */
@MultipartConfig
@WebServlet(name = "svEditarPerro", urlPatterns = {"/svEditarPerro"})
public class svEditarPerro extends HttpServlet {

    ArrayList<Perro> misPerros = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    /**
     *
     * @throws ServletException
     */
    public void init() throws ServletException {
    }

    private Perro buscarPerroPorNombre(String nombre) {
        for (Perro perro : misPerros) {
            if (perro.getNombre().equals(nombre)) {
                return perro;
            }
        }
        return null;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        ServletContext context = getServletContext();

        ArrayList<Perro> misPerros = new ArrayList<>();
        try {
            Persistencia.lectura(misPerros, context);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(svPerros.class.getName()).log(Level.SEVERE, null, ex);
        }
        processRequest(request, response);

        String nombreEditar = request.getParameter("nombreEditar");
        String uploadPath = context.getRealPath("/foto");
        if (nombreEditar != null && !nombreEditar.isEmpty()) {

            Perro editarPerro = buscarPerroPorNombre(nombreEditar);

            if (editarPerro != null) {

                String nuevoNombre = request.getParameter("nuevoNombre");
                String nuevaRaza = request.getParameter("nuevaRaza");
                String nuevoPuntos = request.getParameter("nuevosPuntos");
                String nuevaEdad = request.getParameter("nuevaEdad");
                Part nuevaFotoPart = request.getPart("fotoEditar");
                editarPerro.setNombre(nuevoNombre);
                editarPerro.setRaza(nuevaRaza);
                editarPerro.setPuntos(Integer.parseInt(nuevoPuntos));
                editarPerro.setEdad(Integer.parseInt(nuevaEdad));
                if (nuevaFotoPart != null && nuevaFotoPart.getSize() > 0) {
                    String nuevoNombreArchivo = nuevoNombre
                            + nuevaFotoPart.getSubmittedFileName().substring(
                                    nuevaFotoPart.getSubmittedFileName().lastIndexOf('.')
                            );
                    String nuevoFilePath = uploadPath + File.separator + nuevoNombreArchivo;
                    try (InputStream fileContent = nuevaFotoPart.getInputStream(); FileOutputStream outputStream = new FileOutputStream(nuevoFilePath)) {
                        int read;
                        byte[] buffer = new byte[1024];
                        while ((read = fileContent.read(buffer)) != -1) {
                            outputStream.write(buffer, 0, read);
                        }
                    }

                    editarPerro.setFoto(nuevoNombreArchivo);
                }

                Persistencia.escritura(misPerros, context);

                response.sendRedirect("index.jsp");
                return;
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
