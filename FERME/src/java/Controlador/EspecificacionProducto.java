/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.BD;
import Modelo.Producto;
import Modelo.TipoProducto;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.ResultSet;
import java.util.Base64;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lordp
 */
@WebServlet(name = "EspecificacionProducto", urlPatterns = {"/EspecificacionProducto"})
public class EspecificacionProducto extends HttpServlet {

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
                String nombre = request.getParameter("dato");
                nombre = nombre.trim();
                BD bd = new BD();
                String q = "select * from producto where nombre = '" + nombre + "'";
                ResultSet res = bd.read(q);
                res.next();
                Producto prod = new Producto();
                
                Blob blob = res.getBlob("imagen");
                 
                InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;

                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);                  
                }

                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                TipoProducto tipo = (TipoProducto)request.getSession().getAttribute("tipo1");
                prod.setId_producto(res.getString("id_producto"));
                prod.setDesc_producto(res.getString("desc_producto"));
                prod.setPrecio_unitario(Integer.parseInt(res.getString("precio_unitario")));
                prod.setPrecio_compra(Integer.parseInt(res.getString("precio_compra")));
                prod.setStock(Integer.parseInt(res.getString("stock")));
                prod.setStock_critico(Integer.parseInt(res.getString("stock_critico")));
                prod.setFecha_venc(res.getString("fecha_venc"));
                prod.setTipo_producto_id_tipoprod(tipo.getId_tipoprod());
                prod.setEstado(Integer.parseInt(res.getString("estado")));
                prod.setBase64Image(base64Image);
                prod.setNombre(res.getString("nombre"));
                request.getSession().setAttribute("prod1", prod);
                response.sendRedirect("especificacionproducto.jsp");
            }catch(Exception e)
            {
                response.sendRedirect("index.jsp");
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