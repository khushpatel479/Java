<%-- 
    Document   : explore_menu_display
    Created on : 4 Aug, 2024, 9:05:09 PM
    Author     : Acer
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="explore_menu_display.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="app" >
            <div class='cart'>
    <div class='cart-items'>
      <div class='cart-items-title'>
        <p>Items</p>
        <p>Title</p>
      
      </div>
            <%
            Connection con = null;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/food_project","root","");
            ResultSet rs;
            Statement st;
            String sql="SELECT * FROM explore_item";
            st=con.createStatement();
            rs=st.executeQuery(sql);
            while(rs.next())
            {
                %>
                 <div class="cart-items-title cart-items-item">
                <img src="Data_image/<%=rs.getString("img")%>"/>
                <p><%=rs.getString("name")%></p>
                  </div>
                <hr>
                <%
            }
            
            %>
    </div>
            </div>
        </div>
    </body>
</html>
