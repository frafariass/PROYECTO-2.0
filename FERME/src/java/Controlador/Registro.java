/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.BD;
import Modelo.Cifrado;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lordp
 */
@WebServlet(name = "Registro", urlPatterns = {"/Registro"})
public class Registro extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String rut = request.getParameter("rut");
        rut = rut.replace(".", "");
        rut = rut.trim();
        String rutsinguion = rut;
        rutsinguion = rutsinguion.replace("-", "");

        
        String digitorutingresado = Character.toString(rut.charAt(rut.length()-1));
        
                try {
                    
                    char digitochar = digitorutingresado.charAt(0);
                    String clave = request.getParameter("clavesecreta");                                                                                 
                    String nombre = request.getParameter("nombre");
                    String email = request.getParameter("email");
                    String apellido = request.getParameter("apellido");
                    String direccion = request.getParameter("direccion");
                    String telefono = request.getParameter("telefono");
                    int rol = 4;
                    if(request.getSession().getAttribute("usu1") != null)
                    {
                        rol = Integer.parseInt(request.getParameter("rol"));
                    }
                    if(telefono.length() == 0)
                    {
                        telefono = "0";
                    }
                    if(direccion.length() == 0)
                    {
                        direccion = "NO INGRESADO";
                    }
                    if(apellido.length() == 0)
                    {
                        apellido = "NO INGRESADO";
                    }
                    int rutint;
                    if(rutsinguion.length() >= 9)
                    {
                        String rutingresar = rutsinguion.substring(0,8);
                        rutint = Integer.parseInt(rutingresar);
                    }else
                    {
                        String rutingresar = rutsinguion.substring(0,7);
                        rutint = Integer.parseInt(rutingresar);
                    }

                    BD bd = new BD();
                    String q;
                    int idmaximo = 0;
                    if(rol == 5)
                    {
                        q = "select max(id_user) from usuario WHERE ID_USER <= 999";
                    }else
                    {
                        q  = "select max(id_user) from usuario where id_user >= 1001";
                    }
                    ResultSet res = bd.read(q);
                    if(res.next())
                    {
                        if(res.getString("max(id_user)") != null)
                        {
                            idmaximo = Integer.parseInt(res.getString("max(id_user)")) + 1;
                        }else
                        {
                            if(rol == 5)
                            {
                                idmaximo = 101;
                            }else
                            {
                                idmaximo = 1001;
                            }
                        }
                    }
                    
               
                    q = "insert into usuario "
                                      + "values ('"+digitochar+"', '"+nombre+"', "
                                       + "'"+apellido+"', '"+email+"', '"+clave+"', '"+direccion+"', "
                            + "'"+telefono+"', "+1+", "+1+", "+idmaximo+", "+rol+", "+rutint+")";
                    bd.update(q);
                    response.sendRedirect("exito.jsp");
                }catch (IOException | NumberFormatException | SQLException e) { 
                    response.sendRedirect("error.jsp");
                }

        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
