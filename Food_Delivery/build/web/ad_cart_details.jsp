<%-- 
    Document   : ad_cart_details
    Created on : 6 Aug, 2024, 5:41:46 PM
    Author     : Acer
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="ad_cart_details.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="app">
                 <div class='cart'>
    <div class='cart-items'>
      <div class='cart-items-title'>
        <p>Image</p>
        <p>Food-Name</p>
        <p>Price</p>
          </div>
      <%
          String bn = request.getParameter("email").toString();
          int count1=0;
          int pr=0;
          int order_id=0;
          String date = "";
          String eu = "";
     
        Connection con = null;
               Class.forName("com.mysql.jdbc.Driver");
               con = DriverManager.getConnection("jdbc:mysql://localhost/food_project","root","");
               ResultSet rs;
                PreparedStatement ps;
                    String sql1 = "SELECT count(name) as nm FROM cart WHERE email = ?";
                    ps=con.prepareStatement(sql1);
                    ps.setString(1, bn);
                    rs=ps.executeQuery();
                    while(rs.next())
                    {
                        count1 = rs.getInt("nm"); 
                    }
                    String sql3 = "SELECT * FROM place_order WHERE email=?";
                    ps= con.prepareStatement(sql3);
                    ps.setString(1, bn);
                    rs = ps.executeQuery();
                    while(rs.next())
                    {
                        order_id = rs.getInt("order_id");
                        date = rs.getDate("date").toString();
                    }
                    String sql2 = "SELECT sum(price) as pr FROM cart WHERE email = ?";
                    ps=con.prepareStatement(sql2);
                    ps.setString(1, bn);
                    rs=ps.executeQuery();
                    while(rs.next())
                    {
                        pr = rs.getInt("pr"); 
                    }
               String sql = "SELECT * FROM cart WHERE email = ?";
              ps = con.prepareStatement(sql);
              ps.setString(1,bn);
              rs=ps.executeQuery();
               while(rs.next())
               {
                   %>
                        <div class="cart-items-title cart-items-item">
                            <img src="Data_image/<%=rs.getString("img")%>"/>
                            <p><%=rs.getString("name")%></p>
                            <p><%=rs.getInt("price")%></p>
                            
                      </div>
                            
                   <%
                       eu = rs.getString("email");
               }

      
          
        
        %>
        <p>Total Items : <%=count1%></p>
                <p>Total Amount : <%=pr%></p>
                <p>Order Id : <%=order_id%></p>
                <p>Email : <%=eu%></p>
                <p>Date : <%=date%></p>
                <a href="web3.jsp?er=<%=eu%>"><button class="btn-primary">Dilivered</button></a>
        </div>
         
        </div>
            </div>
      
    
        </div>
    </body>
</html>
