<%-- 
    Document   : prev_order
    Created on : 26 Aug, 2024, 10:52:44 AM
    Author     : Acer
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="prev_order.css" />
    </head>
    
    <body>
           <div class="app">
                 <div class='cart'>
    <div class='cart-items'>
      <div class='cart-items-title'>
        <p>Email</p>
        <p>Quantity</p>
        <p>Total_amount</p>
        <p>Order_id</p>
        <p>Date</p>
          </div>
        <%
            String em = session.getAttribute("uname").toString();
           Connection con = null;
           Class.forName("com.mysql.jdbc.Driver");
           con = DriverManager.getConnection("jdbc:mysql://localhost/food_project","root","");
           String sql = "SELECT * FROM delevered_orders WHERE email = ?";
           PreparedStatement ps = con.prepareStatement(sql);
           ps.setString(1, em);
           ResultSet rs = ps.executeQuery();
           while(rs.next())
           {
               %>
               <div class="cart-items-title cart-items-item">
                   <p ><%=rs.getString("email")%></p>
                            <p><%=rs.getInt ("quantity")%></p>
                            <p><%=rs.getInt("total_amount")%></p>
                            <p>#<%=rs.getInt("order_id")%></p>
                            <p><%=rs.getDate("date")%></p>
                              </div>
               <%
               
           }
           
               
        %>
       
    </div>
         </div>
           </div>
    </body>
</html>
