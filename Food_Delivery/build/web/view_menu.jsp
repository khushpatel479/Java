<%-- 
    Document   : view_menu
    Created on : 4 Aug, 2024, 11:06:55 AM
    Author     : Acer
--%>
<%@page import='java.sql.*' %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="view_menu.css"/>
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
       Connection con = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/food_project","root","");
                    String url = "select * from food_items";
                    Statement st;
                    st = con.createStatement();
                    ResultSet rs = st.executeQuery(url);
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
            <br>
            <div class="ty">
            <button class="plus" id="plus">+</button><span class="sp" name="qty" id="qty">0</span><button class="min" id="min">-</button>
            
<script src="food_add.js"></script>
            </div>
            <br>
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
