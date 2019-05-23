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
        Connection conexion = null;

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String rut = request.getParameter("rut");
        rut = rut.replace(".", "");
        String rutsinguion = rut;
        rutsinguion = rutsinguion.replace("-", "");

        int indicefor = 0;
        if (rutsinguion.length() == 8) {
            indicefor = 1;
        }
    
        int total = 0;
            for (int i = 7; i >= indicefor; i--) {
                int valor = rut.charAt(i) - '0';
                if (rutsinguion.length() == 8) {
                    valor = (rut.charAt(i-1)) - '0';
                }
                switch(i){
                    case 0:
                        total += valor * 3;
                        break;
                    case 1: 
                        total += valor * 2;
                        break;
                    case 2: 
                        total += valor * 7;
                        break;
                    case 3: 
                        total += valor * 6;
                        break;
                    case 4: 
                        total += valor * 5;
                        break;
                    case 5: 
                        total += valor * 4;
                        break;
                    case 6: 
                        total += valor * 3;
                        break;
                    case 7: 
                        total += valor * 2;
                        break;
                    default:
                        break;
                }
            }
            
        int resto = total % 11;
        resto = 11 - resto;
        String digitocalculado = Integer.toString(resto);
        if (resto == 11) {
            digitocalculado = "k";
        }
        String digitorutingresado = Character.toString(rut.charAt(rut.length()-1));
        
        if (digitocalculado.equals(digitorutingresado) && request.getParameter("telefono").length() >= 9) {
            String clave = request.getParameter("clave");
            String conclave = request.getParameter("conclave");
            if (clave.equals(conclave)) {
                try {

                    char digitochar = digitorutingresado.charAt(0);
                    String clavecifrada = clave;                                                                                   
                    String nombre = request.getParameter("nombre");
                    String email = request.getParameter("email");
                    String apellido = request.getParameter("apellido");
                    String direccion = request.getParameter("direccion");
                    String telefono = request.getParameter("telefono");
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
                    Usuario usu = new Usuario(rutint, digitochar, nombre, apellido, email, clavecifrada, 
                            direccion, telefono, 1, 1);

                    request.getSession().setAttribute("usu1", usu);

                    BD bd = new BD();
                    
                    String q = "insert into usuario "
                                      + "values ('"+rutint+"', '"+digitochar+"', "
                                       + "'"+nombre+"', '"+apellido+"', '"+email+"', '"+clavecifrada+"', '"+direccion+"', "+telefono+", "+1+", "+1+")";
                    bd.update(q);
                    request.getRequestDispatcher("exito.jsp").forward(request, response);
                }catch (Exception e) { 
                        request.getRequestDispatcher("error.jsp").forward(request, response);
                }
                try {
                    if (conexion != null)
                    conexion.close();    
                }catch (SQLException e3) {
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            }else{
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        }else
        {
            request.getRequestDispatcher("error.jsp").forward(request, response);
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