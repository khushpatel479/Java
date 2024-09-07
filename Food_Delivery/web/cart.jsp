<%-- 
    Document   : cart
    Created on : 4 Aug, 2024, 9:27:58 AM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import='java.sql.*'%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="cart.css"/>
   
    </head>
    <body>
        <div class="app">
                 <div class='navbar'>
            <img src="images/logo.png" class='logo'>
        <ul class='navbar-menu'>
            <a href="index.jsp"> <li>Home</li></a>
            <a href="view_menu.jsp"> <li>Menu</li></a>
            <li>Mobile-App</li>
          <%
          if(session.getAttribute("uname")!=null)
          {
              %>
            <a href="prev_order.jsp"><li>View Orders</li></a>
            <%
          }
          %>
            

        </ul>
                 </div>
            <hr/>
     <div class='cart'>
    <div class='cart-items'>
      <div class='cart-items-title'>
        <p>Image</p>
        <p>Name of Product</p>
        <p>Price</p>
        <p>Remove</p>
      </div>
            <%
                String nm = session.getAttribute("uname").toString();
           Connection con = null;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/food_project","root","");
            ResultSet rs;
            String sql = "SELECT * FROM cart WHERE email=?";
            PreparedStatement ps;
            ps = con.prepareStatement(sql);
            ps.setString(1,nm );
            rs = ps.executeQuery();
            while(rs.next())
            {
                %>
                 <div class="cart-items-title cart-items-item">
                 
                <img src="Data_image/<%=rs.getString("img")%>"/>
                <p><%=rs.getString("name")%></p>
                <p><%=rs.getInt("price")%></p>
                <a href="remove_cart?id=<%=rs.getInt("id")%>"><p>X</p></a>
                 </div>
                 <hr/>
                <%
            }
int tot = 0;
String sql1 = "SELECT sum(price) AS ty FROM cart WHERE email = ?";
ps = con.prepareStatement(sql1);
ps.setString(1, nm);
rs = ps.executeQuery();
if(rs.next())
{
    tot=rs.getInt("ty");
}
int qty = 0;
String sql2 = "SELECT count(name) AS ty1 FROM cart WHERE email = ?";
ps = con.prepareStatement(sql2);
ps.setString(1, nm);
rs = ps.executeQuery();
if(rs.next())
{
    qty=rs.getInt("ty1");
}



            
            %>
    </div>
        <div class='cart-bottom'>
    <div class='cart-total'>
    <h2>cart-total</h2>

<div>
  <div class='cart-total-details'>
    <p>sub-total</p>
    <p><%=tot%></p>
  </div>
  <hr/>
  <div  class='cart-total-details'>
      <p>Total Items</p>
  <p><%=qty%></p>
  </div>
  <hr/>
  <div  class='cart-total-details'>
    <b>Total</b>
    <b><%=tot%></b>
  </div>
      
</div>
  <%
  if(tot==0)
  {
     
  }
else
{
    %>
      <a href="place_order.jsp"><button>Check out</button></a>
    <%
}
  %>
  

    </div>

    </div>   
             </div>

        </div>
    </body>
</html>
