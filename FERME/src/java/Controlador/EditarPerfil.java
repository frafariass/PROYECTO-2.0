/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.BD;
import Modelo.Cifrado;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lordp
 */
@WebServlet(name = "EditarPerfil", urlPatterns = {"/EditarPerfil"})
public class EditarPerfil extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            try
            {
                Usuario usu = (Usuario)request.getSession().getAttribute("usu1"); 
                String clavecifrada = request.getParameter("nuevaclavesecreta");
                if(request.getParameter("clavesecreta").equals(usu.getContrasena()))
                {
                    BD bd = new BD();
                    if(request.getParameter("email") != "")
                    {
                        usu.setEmail_user(request.getParameter("email"));
                    }
                    if(request.getParameter("telefono") != "")
                    {
                        usu.setFono_user(request.getParameter("telefono"));
                    }else
                    {
                        usu.setFono_user("0");
                    }
                    if(clavecifrada != "")
                    {
                        usu.setContrasena(clavecifrada);
                    } 
                    if(request.getParameter("direccion") != "")
                    {
                        usu.setDireccion_user(request.getParameter("direccion"));
                    }else
                    {
                        usu.setDireccion_user("NO INGRESADO");
                    }    
                    if(request.getParameter("apellido") != "")
                    {
                        usu.setApellido_user(request.getParameter("apellido"));
                    }else
                    {
                        usu.setApellido_user("NO INGRESADO");
                    }
                    if(request.getParameter("nombre") != "")
                    {
                        usu.setNombre_user(request.getParameter("nombre"));
                    }   
                    String q = "update usuario"
                            + " set email_user = '" + usu.getEmail_user() + "', contrasena = '" + clavecifrada
                            + "', fono_user = " + usu.getFono_user() + ", direccion_user = '" + usu.getDireccion_user() 
                            + "' , apellido_user = '" + usu.getApellido_user() + "' , nombre_user = '" + usu.getNombre_user() 
                            + "' where rut_user = " + usu.getRut_user();
                    bd.update(q);
                    request.getSession().setAttribute("usu1", usu);
                    response.sendRedirect("exito.jsp");
                }else
                {
                    response.sendRedirect("error.jsp");
                }
            }catch(Exception e)
            {
                response.sendRedirect("error.jsp");
            }
            
            
            
            
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
