<%-- 
    Document   : ad_user_data
    Created on : 6 Aug, 2024, 5:12:26 PM
    Author     : Acer
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="ad_user_data.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <body>
        <div class="app">
            <div class='cart'>
    <div class='cart-items'>
      <div class='cart-items-title'>
        <p>First-Name</p>
        
        <p>Email</p>
        <p>Street</p>
        <p>Phone</p>
     
        
                <p>Order Id</p>
                <p>Actions</p>
                <p>Time Remaining</p>
          </div>
        <%
               Connection con = null;
               Class.forName("com.mysql.jdbc.Driver");
               con = DriverManager.getConnection("jdbc:mysql://localhost/food_project","root","");
               ResultSet rs;
               Statement st;
               String sql = "SELECT * FROM place_order";
               st = con.createStatement();
               rs=st.executeQuery(sql);
               while(rs.next())
               {
                   %>
                        <div class="cart-items-title cart-items-item">
                   <p><%=rs.getString("fname")%></p>
                   
                   <p><%=rs.getString("email")%></p>
                   <p><%=rs.getString("street")%></p>
                  
                   <p><%=rs.getString("phone")%></p>
                   <p><%=rs.getInt("order_id")%></p>
                   <a href="ad_cart_details.jsp?email=<%=rs.getString("email")%>"><p>Click-Here</p></a>
                   <p  id="sp">0</p>
                   <script>
                       let yo = document.querySelector("#sp");
                       let p = 120;
                       let u = ()=>
                       {
                           
                       
                       setInterval(function ()
                       {
                           if(p>0)
                           {
                            p--;
                             yo.innerHTML=p;  
                             
                           }
                       },1000);
                       
    }
    u();
                   </script>
                   <a href="remove_user?id=<%=rs.getString("email")%>"><p>X</p></a>
                     </div>
                   <%
               }
          
        
        %>
          </div>
        </div>
            </div>
        
    </body>
</html>
