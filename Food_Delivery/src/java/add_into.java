/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
//import org.jboss.weld.servlet.SessionHolder;

/**
 *
 * @author Acer
 */
@WebServlet(urlPatterns = {"/add_into"})
public class add_into extends HttpServlet {

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
            HttpSession session = request.getSession();
           String nemail = session.getAttribute("uname").toString();
          
           if( nemail==null)
           {
//               RequestDispatcher pl = request.getRequestDispatcher("login.jsp");
//               pl.include(request, response);
               response.sendRedirect("login.jsp");
           }
         else
           {
//               String p = request.getParameter("qty");
//               int qty = Integer.parseInt(p);
//               out.println(qty);
          String ip = request.getParameter("im");
          int cart_id=0;
          int id = Integer.parseInt(ip);
       
          String img="";
          int pr=0;
          String name="";
          String email = "";
            
           email = (String) session.getAttribute("uname").toString();
//          out.print(email);
  Connection con = null;
          
          try
          {
                ResultSet rs;
            
              Class.forName("com.mysql.jdbc.Driver");
              con = DriverManager.getConnection("jdbc:mysql://localhost/food_project","root","");
              Statement st;
              String sql = "select * from food_items where id="+id+"";
            
              st = con.createStatement();
              rs = st.executeQuery(sql);
              if(rs.next())
              {
                  name = rs.getString("name");
                  img = rs.getString("img");
                  pr = rs.getInt("price");
              }
            
              PreparedStatement ps;
             String iny = "select max(id) from cart";
            ps=con.prepareStatement(iny);
            rs = ps.executeQuery();
             while(rs.next())
             {
                cart_id = rs.getInt(1);
                 cart_id++;
             }
          
           String ins = "insert into cart(id,email,name,img,price) values(?,?,?,?,?)";
           ps=con.prepareStatement(ins);
           ps.setInt(1, cart_id);
           ps.setString(2, email);
           ps.setString(3, name);
           ps.setString(4, img);
           ps.setInt(5, pr);
           
           
//           out.println(email);

           int kl = ps.executeUpdate();
           if(kl>0)
           {
               RequestDispatcher ui  = request.getRequestDispatcher("view_menu.jsp");
               ui.include(request, response);
           }
          }
          catch(Exception e)
          {
              System.out.println(e);
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

