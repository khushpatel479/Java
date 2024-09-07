<%-- 
    Document   : adminside_exp_display
    Created on : 7 Aug, 2024, 5:39:01 PM
    Author     : Acer
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="adminside_exp.css"/>
           
    </head>
    <body>
        <div class="app">
             <div class='cart'>
    <div class='cart-items'>
      <div class='cart-items-title'>
        <p>Id</p>
        <p>Image</p>
        <p>Name of Product</p>
        <p>Modify</p>
      </div>
            <%
           Connection con = null;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/food_project","root","");
            ResultSet rs;
            Statement st;
            String sql = "SELECT * FROM explore_item";
            st = con.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next())
            {
                %>
                 <div class="cart-items-title cart-items-item">
                     <p><%=rs.getInt("id")%></p>
                <img src="Data_image/<%=rs.getString("img")%>"/>
                <p><%=rs.getString("name")%></p>
                <a href="exp_update.jsp?id=<%=rs.getInt("id")%>">Click Here</a>
                 </div>
                <%
            }
            
            %>
    </div>
             </div>
        </div>
    </body>
</html>
