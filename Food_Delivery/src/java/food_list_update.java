/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
/**
 *
 * @author Acer
 */
@MultipartConfig
@WebServlet(urlPatterns = {"/food_list_update"})
public class food_list_update extends HttpServlet {

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
           Part file = request.getPart("img");
          String url = file.getSubmittedFileName();
            String ip = request.getParameter("id");
            int id = Integer.parseInt(ip);
            String im = request.getParameter("exp_id");
            int exp_id = Integer.parseInt(im);
            String name = request.getParameter("name");
            String pr = request.getParameter("price");
            int price = Integer.parseInt(pr);
            String dec = request.getParameter("dec");
            try
            {
                
                Connection con = null;
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/food_project","root","");
                    PreparedStatement ps;
                    String sql = "UPDATE food_items SET name=?,price=?,description=?,explore_id=?,img=? WHERE id=?";
                    ps=con.prepareStatement(sql);
                    ps.setInt(6, id);
                    ps.setString(5, url);
                    ps.setInt(4, exp_id);
                    ps.setString(3, dec);
                    ps.setInt(2, price);
                    ps.setString(1, name);
                    int pl = ps.executeUpdate();
                    if(pl>0)
                    {
                             String uploadpath = "C:/Users/Acer/Documents/NetBeansProjects/Food_Delivery/web/Data_image/"+url;
                             FileOutputStream fs = new FileOutputStream(uploadpath);
                             InputStream il = file.getInputStream();
                             byte[] data = new byte[il.available()];
                             il.read(data);
                                 fs.write(data);
                             fs.close();
                    }
                        
            }
            catch(Exception e)
            {
                out.println(e);
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
