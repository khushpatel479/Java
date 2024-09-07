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
import javax.sound.midi.Soundbank;
import java.sql.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

/**
 *
 * @author Acer
 */
@MultipartConfig
@WebServlet(urlPatterns = {"/Explore_menu"})
public class Explore_menu extends HttpServlet {

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
            System.out.println("ok");
            String name = request.getParameter("name");
              Part file = request.getPart("img");
              String url = file.getSubmittedFileName();
          
            int id = 0;
            
             Connection con = null;
            try
            {
            
              Class.forName("com.mysql.jdbc.Driver");
              con = DriverManager.getConnection("jdbc:mysql://localhost/food_project","root","");
              
               if(con!=null)
              {
                  System.out.println("ol");
              }
               
                    PreparedStatement st;
                    st = con.prepareStatement("SELECT max(id) From explore_item");
                    ResultSet rs = st.executeQuery();
                    if(rs.next())
                    {
                        id= rs.getInt(1);
                        id++;
                    }
                    String query = "INSERT INTO explore_item(id,name,img) VALUES(?,?,?)";
                    st = con.prepareStatement(query);
                    
                    st.setInt(1, id);
                    st.setString(2,name);
                    st.setString(3, url);
                    int roe = st.executeUpdate();
                    if(roe>0)
                    {
                            System.out.println("Addded");
                            String uploadpath = "C:/Users/Acer/Documents/NetBeansProjects/Food_Delivery/web/Data_image/"+url;
                            System.out.println(uploadpath);
                            FileOutputStream fs = new FileOutputStream(uploadpath);
                            InputStream im = file.getInputStream();
                            byte[] data = new byte[im.available()];
                            im.read(data);
                            fs.write(data);
                            fs.close();
                    }
              
             
            }
            catch(Exception e)
                    {
                        out.print(e);
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
