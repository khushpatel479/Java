<%-- 
    Document   : adminside_food_items
    Created on : 7 Aug, 2024, 5:51:59 PM
    Author     : Acer
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="adminside_food_dis.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="app">
             <div class='cart'>
    <div class='cart-items'>
      <div class='cart-items-title'>
        <p>Id</p>
        <p>Image</p>
        <p>Name Of Food</p>
        <p>Price</p>
        <p>Description</p>
        <p>Modify</p>
      
      </div>
            <%
           Connection con = null;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/food_project","root","");
            ResultSet rs;
            Statement st;
            String sql = "SELECT * FROM food_items";
            st = con.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next())
            {
                %>
                 <div class="cart-items-title cart-items-item">
                     <p><%=rs.getInt("id")%></p>
                     <img src="Data_image/<%=rs.getString("img")%>"/>
                     <p><%=rs.getString("name")%></p>
                       <p><%=rs.getInt("price")%></p>
                       <p><%=rs.getString("description")%></p>
                       <a href="food_list_update.jsp?id=<%=rs.getInt("id")%>"><p>Click Here </p></a>
                       
                 </div>
                <%
            }
            
            %>
    </div>
             </div>
        </div>
    </body>
</html>
