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

@WebServlet(urlPatterns = {"/food_item_add"})
public class food_item_add extends HttpServlet {

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
            
            int id = 0;
            String im = request.getParameter("exp_id");
            int exp_id = Integer.parseInt(im);
            String name = request.getParameter("name");
            String pr = request.getParameter("price");
            int price = Integer.parseInt(pr);
            String dec = request.getParameter("dec");
         
            try
            {
              
            Connection con  = null;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/food_project","root" , "");
            PreparedStatement ps;
            ResultSet rs;
            ps = con.prepareStatement("SELECT max(id) FROM food_items");
            rs=ps.executeQuery();
            while(rs.next())
            {
                id=rs.getInt(1);
                id++;
            }
            String sql = "insert into food_items(id,name,price,description,explore_id,img) values(?,?,?,?,?,?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setInt(3, price);
            ps.setString(4, dec);
            ps.setInt(5, exp_id);
            ps.setString(6,url);
            int ex = ps.executeUpdate();
            if(ex>0)
            {
                System.out.println("added");
                String uploadpath = "C:/Users/Acer/Documents/NetBeansProjects/Food_Delivery/web/Data_image/"+url;
                FileOutputStream fo = new FileOutputStream(uploadpath);
                InputStream ie = file.getInputStream();
                byte data[]= new byte[ie.available()];
                ie.read(data);
                fo.write(data);
                fo.close();
                
            }
            else
            {
                System.out.println("Sorry");
            }
            
            
           
            }
catch(Exception e)
{
    System.out.println(e);
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
