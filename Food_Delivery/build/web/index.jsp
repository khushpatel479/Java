<%-- 
    Document   : index.jsp
    Created on : 2 Aug, 2024, 11:41:52 AM
    Author     : Acer
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="index.css"/>
    </head>
    <body>
        <div class="app">
           

         <div class='navbar'>
            <img src="images/logo.png" class='logo'>
        <ul class='navbar-menu'>
            <li>Home</li>
            <a href="view_menu.jsp"> <li>Menu</li></a>
            <li>Mobile-App</li>
            <li>Contact Us</li>
            

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
        <div class='Header'>
      <div class='Header-contents'>
        <h2>order your favorite food here </h2>
        <p>Choose from a diverse menu featuring a delectable array of dishes crafted with finest ingridents</p>
        <a href="view_menu.jsp"><button>view menu</button></a>
      </div>
    </div>
            
           
          
         <%
             Connection con = null;
             String im="";
             Class.forName("com.mysql.jdbc.Driver");
             con = DriverManager.getConnection("jdbc:mysql://localhost/food_project","root","");
             if(con!=null)
             {
                 System.out.println("ok");
             }
             ResultSet rs;
             String sql = "select * from explore_item";
             Statement st;
             st = con.createStatement();
             rs = st.executeQuery(sql);
             %>
             <div class="exploremenu" id='exploremenu'>
             <h1>Explore Menu</h1>
<p class='exploremenutext'>Choose from a diverse menu featuring a delectable array of dishes.</p>
<%
             while(rs.next())
             {
                 int img_id = rs.getInt("id");
                 %>
              

                 <div class='explore-menu-list'><a href="food_display.jsp?img_id=<%=img_id%>">
    <%
                  im = rs.getString("img");
                 %>
                 <div class="explore-menu-list-item">
                   <img  src="Data_image/<%=im%>"/>
    </div>
    <p><%=rs.getString("name")%></p>
    
                <%
             }
             %>
           
                </div></a>
             
             
                 </div>
             
             
             
        </div>
               
             
             
    </body>
</html>

