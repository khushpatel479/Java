
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.lang.Math;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;    
/**
 *
 * @author Acer
 */
@WebServlet(urlPatterns = {"/place_order"})
public class place_order extends HttpServlet {

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
            int min = 1;
            int max = 3000;
            int order_id =(int) (Math.random()*20000);
            out.print(order_id);
            int id=0;
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");
            String street = request.getParameter("street");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String z = request.getParameter("zipcode");
            int zipcode = Integer.parseInt(z);
             String country = request.getParameter("country");
            String ph = request.getParameter("phone");
            int phone = Integer.parseInt(ph);
        LocalDateTime dtm = LocalDateTime.now();  
      
           try
           {
               Connection con=null;
               Class.forName("com.mysql.jdbc.Driver");
               con = DriverManager.getConnection("jdbc:mysql://localhost/food_project","root","");
               Statement st;
               PreparedStatement ps;
               ResultSet rs;
               String il = "SELECT max(id) FROM place_order";
               st=con.createStatement();
               rs=st.executeQuery(il);
               while(rs.next())
               {
                   id = rs.getInt(1);
                   id++;
               }
               
               String sql = "INSERT INTO place_order(id,fname,lname,email,street,city,state,zipcode,country,phone,order_id,date) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
               ps=con.prepareStatement(sql);
               ps.setInt(1, id);
               ps.setString(2, fname);
               ps.setString(3, lname);
               ps.setString(4, email);
                ps.setString(5, street);
                ps.setString(6, city);
                ps.setString(7, state);
                ps.setInt(8, zipcode);
                ps.setString(9, country);
                ps.setInt(10, phone);
                ps.setInt(11, order_id);
                ps.setDate(12, java.sql.Date.valueOf(java.time.LocalDate.now()));
                int u = ps.executeUpdate();
                if(u>0)
                {
                    RequestDispatcher il1 = request.getRequestDispatcher("biill.jsp");
                    il1.forward(request, response);
                }
                else
                {
                    out.println("not inserted");
                }
           }
           catch(Exception p)
           {
               out.print(p);
                       
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
