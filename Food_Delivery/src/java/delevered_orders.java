/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.Set;
import javax.servlet.RequestDispatcher;
/**
 *
 * @author Acer
 */
@WebServlet(urlPatterns = {"/delevered_orders"})
public class delevered_orders extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * 
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
         
          String[]  name = request.getParameterValues("food_name");
          int id = 0;
          String l = request.getParameter("qty");
          int qty = Integer.parseInt(l);
          String h = request.getParameter("total_amount");
          int total = Integer.parseInt(h);
          String email = request.getParameter("email");
          String f  = request.getParameter("order");
            int order = Integer.parseInt(f);
            String date = request.getParameter("date");
            String address = request.getParameter("address");
          
            Connection con = null;
            try
            {
            
              Class.forName("com.mysql.jdbc.Driver");
              con = DriverManager.getConnection("jdbc:mysql://localhost/food_project","root","");
             String sql = "select max(id) from delevered_orders";
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql);
             while(rs.next())
             {
                 id=rs.getInt(1);
                 id++;
             }
             String sql2= "INSERT INTO delevered_orders(id , quantity, total_amount , order_id,email ,date,address) VALUES(?,?,?,?,?,?,?)";
             PreparedStatement ps =con.prepareStatement(sql2);
          ps.setInt(1, id);
          ps.setInt(2, qty);
          ps.setInt(3,total);
          ps.setInt(4, order);
          ps.setString(5,email);
          ps.setString(6, date);
          ps.setString(7, address);
          int y = ps.executeUpdate();
          if(y>0)
          {
              RequestDispatcher op = request.getRequestDispatcher("ad_user_data.jsp");
              op.include(request, response);
          }
                
            
         
        }
             catch(Exception r)
            {
                out.print(r);
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
