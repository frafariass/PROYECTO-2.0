/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.BD;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lordp
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
            String rut = request.getParameter("rut");
        String clave = request.getParameter("clave");
        String clavecifrada = clave;
        if (rut != null && clave != null) {
            int rutint;
            BD bd = new BD();
            try
            {
                rut = rut.replace(".", "");
                if (rut.contains("-")) {
                    rut = rut.replace("-", "");
                    if(rut.length() >= 9)
                    {
                        String rutingresar = rut.substring(0,8);
                        rutint = Integer.parseInt(rutingresar);
                    }else
                    {
                        String rutingresar = rut.substring(0,7);
                        rutint = Integer.parseInt(rutingresar);
                    }
                    
                    String q = "select * from usuario where rut_user = " +rutint+ " and " + "contrasena = '" +clavecifrada+"'";                
                    ResultSet res = bd.read(q);
                    if(res != null)
                    {
                        res.next(); 
                        Usuario usu = new Usuario(Integer.parseInt(res.getString("rut_user")), res.getString("dv_user").charAt(0), 
                        res.getString("nombre_user"), res.getString("apellido_user"), 
                        res.getString("email_user"), res.getString("contrasena"), 
                        res.getString("direccion_user"), res.getString("fono_user"), 
                        Integer.parseInt(res.getString("rubro_id_rubro")), Integer.parseInt(res.getString("estado")));
                        request.getSession().setAttribute("usu1", usu);
                        response.sendRedirect("index.jsp");
                    }else
                    {
                        response.sendRedirect("error.jsp");
                    }
                    
                    
                    
                }else
                {
                    rut = rut.substring(0, rut.length()-1);
                    rutint = Integer.parseInt(rut);
                    String q = "select * from usuario where rut_user = " +rutint+ " and " + "contrasena = '" +clavecifrada+"'";               
                    ResultSet res = bd.read(q);
                    res.next();  
                    Usuario usu = new Usuario(Integer.parseInt(res.getString("rut_user")), res.getString("dv_user").charAt(0), 
                        res.getString("nombre_user"), res.getString("apellido_user"), 
                        res.getString("email_user"), res.getString("contrasena"), 
                        res.getString("direccion_user"), res.getString("fono_user"), 
                        Integer.parseInt(res.getString("rubro_id_rubro")), Integer.parseInt(res.getString("estado")));
                    request.getSession().setAttribute("usu1", usu);
                    response.sendRedirect("index.jsp");
                }
                
                
                
            }catch (IOException | NumberFormatException | SQLException ex){
                response.sendRedirect("error.jsp");
            }
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