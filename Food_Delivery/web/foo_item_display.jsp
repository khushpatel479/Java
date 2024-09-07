<%-- 
    Document   : foo_item_display
    Created on : 4 Aug, 2024, 9:32:24 PM
    Author     : Acer
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        Connection con = null;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/food_project","root","");
        ResultSet rs;
        Statement st;
        String sql = "SELECT * FROM food_items";
        st=con.createStatement();
        rs=st.executeQuery(sql);
        while(rs.next())
        {
            %>
            <img src="Data_image/<%=rs.getString("img")%>"/>
            <%
        }
        %>
    </body>
</html>
