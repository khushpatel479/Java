/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
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
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import javax.ws.rs.core.Response;
/**
 *
 * @author Acer
 */
@MultipartConfig
@WebServlet(urlPatterns = {"/exp_update"})
public class exp_update extends HttpServlet {

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
           Connection con = null;
           String name = request.getParameter("name");
           String i = request.getParameter("id");
           int id = Integer.parseInt(i);
        Part file = request.getPart("img");
        String url = file.getSubmittedFileName();
        out.print(url);
        out.print(name);
        
           
           try
           {
               Statement st;
           Class.forName("com.mysql.jdbc.Driver");
           con = DriverManager.getConnection("jdbc:mysql://localhost/food_project","root","");
           PreparedStatement ps;
         String sql = "UPDATE explore_item SET name=? , img= ? WHERE id=?";
//         st=con.createStatement();
//         int cv = st.executeUpdate(sql);
ps=con.prepareStatement(sql);
ps.setInt(3, id);
ps.setString(2, url);
ps.setString(1, name);
int cv = ps.executeUpdate();
out.print(cv);
           if(cv>0)
           {
                    String uploadpath = "C:/Users/Acer/Documents/NetBeansProjects/Food_Delivery/web/Data_image/"+url;
                    FileOutputStream fo = new FileOutputStream(uploadpath);
                    InputStream il = file.getInputStream();
                    byte[] data = new  byte[il.available()];
                    il.read(data);
                    fo.write(data);
                    out.print(il.read(data));
                     
                    fo.close();
                    RequestDispatcher rd = request.getRequestDispatcher("explore_menu_display.jsp");
                    rd.include(request, response);
           }

           
           }
           catch(Exception r)
           {
               System.out.println(r);
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
