<%-- 
    Document   : place_order
    Created on : 5 Aug, 2024, 5:11:34 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="place_order.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="app">
            <form action="place_order" method="post" class='place-order'>
    <div class='place-order-left'>
    <p class='title'>Delivery Information</p>
    <div class='multi-fields'>
      <input type='text' name="fname" placeholder='First Name'/>
      <input type='text' name="lname" placeholder='Last Name'/>
    </div>
    <input type='text' name="email" placeholder='Email' value="<%=session.getAttribute("uname")%>"/>
    <input type='text' name="street" placeholder='Street'/>
    
    <div class='multi-fields'>
      <input type='text' name="city" placeholder='City'/>
      <input type='text' name="state" placeholder='State'/>
    </div>
    <div class='multi-fields'>
      <input type='text' name="zipcode" placeholder='Zip Code'/>
      <input type='text' name="country" placeholder='Country'/>
    </div>
    <input type='text' name="phone" placeholder='phone'></input>
    </div>
    <div class='place-order-right'>
    <div class='cart-total'>
       <%
        Connection con =null;
        String email = session.getAttribute("uname").toString();
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/food_project","root","");
        int price = 0;
        ResultSet rs;
        PreparedStatement ps;
        String sql = "SELECT sum(price) AS pl  from cart WHERE email=?";
        ps = con.prepareStatement(sql);
        ps.setString(1, email);
        rs = ps.executeQuery();
        while(rs.next())
        {
            price = rs.getInt("pl");
        }
        %>
    <h2>cart-total</h2>

<div>
  <div class='cart-total-details'>
    <p>sub-total</p>
    <p><%=price%></p>
  </div>
  <hr/>
  
  

</div>
  <input style="background-color: tomato; color: white" type="submit" value="Place order">
    </div>

    </div>
   </form>
        </div>
    </body>
</html>
