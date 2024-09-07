<%-- 
    Document   : food_display
    Created on : 2 Aug, 2024, 12:42:20 PM
    Author     : Acer
--%>
<%@page import='java.sql.*' %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="food_disply.css">
<!--        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">-->
    </head>
    <body>
        <div class="app">
           <div class='navbar' style="text-decoration: none;">
            <img src="images/logo.png" class='logo'>
        <ul class='navbar-menu'>
            <a href="index.jsp"><li>Home</li></a>
            <a href="view_menu.jsp"> <li>Menu</li></a>
            <a href="#"><li>Mobile-App</li></a>
            <a href="#"><li>Contact Us</li></a>
            

        </ul>
               
            <div class='navbar-right'>
            <img class='sr' src="images/search.png"/> 
            <div class='search-icon' >
                <a href="cart.jsp"><img class='cr' src="images/cart.png"/></a>
            <div class='dot'></div>
            </div>
            <a href="signup.jsp">  <button>sign in</button></a>
        </div>
      </div>
              <div class="cointaner">
           <%
               String id = request.getParameter("img_id");
               int up = Integer.parseInt(id);
       Connection con = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/food_project","root","");
                    String url = "select * from food_items where explore_id=?";
                    PreparedStatement ps;
                    ps=con.prepareStatement(url);
                    ps.setInt(1,up);
                    ResultSet rs = ps.executeQuery();
                    
                    while(rs.next())
                    {
                    %>    
                     <div class="card">
                              <img src="Data_image/<%=rs.getString("img")%>" alt="kp">
        <div class="intro">
            <h1><%=rs.getString("name")%></h1>
            <p>
             <%=rs.getString("description")%>
            </p>
            <a href="add_into?im=<%=rs.getInt("id")%>"><button class="btn" >Add To Cart</button></a>
               
        </div>
        </div>
                           
                    <%
                        
                        }
%>
    


              </div>
        </div>
    </body>
</html>
