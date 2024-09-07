<%-- 
    Document   : web3
    Created on : 17 Aug, 2024, 10:20:31 AM
    Author     : Acer
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <form action="https://api.web3forms.com/submit" method="POST">
        <input type="hidden" name="access_key" value="f6d19691-4463-4697-b62f-99f3f7619c8d">
        <%
            int tot = 0;
            String um = request.getParameter("er");
        Connection con = null;
               Class.forName("com.mysql.jdbc.Driver");
               con = DriverManager.getConnection("jdbc:mysql://localhost/food_project","root","");
               String sql = "SELECT * FROM cart WHERE email = ?";
               PreparedStatement ps = con.prepareStatement(sql);
               ps.setString(1, um);
               ResultSet rs = ps.executeQuery();
               while(rs.next())
               {
                   %>
                   Food_Name : <input type="text" name="food_name" value="<%=rs.getString("name")%>"/>
                   <br>
                   <%
               }
                String sql1 = "SELECT SUM(price) AS tot FROM cart WHERE email = ? ";
ps = con.prepareStatement(sql1);    
ps.setString(1, um);
rs = ps.executeQuery();
while(rs.next())
{
    tot = rs.getInt("tot");
}
%>
Total Amount : <input type="number" name="total_amount" value="<%=tot%>"/>
<br>
<%
String sql2 = "SELECT * FROM place_order WHERE email = ?";
ps=con.prepareStatement(sql2);
ps.setString(1, um);
rs = ps.executeQuery();
while(rs.next())
{
    %>
    Order_id : <input type="number" name="order" value="<%=rs.getInt("order_id")%>"/>
    <br>
    Email : <input type="text" name="email" value="<%=rs.getString("email")%>"/>
    <br/>
    
    Address : <input type="text" name="address" value="<%=rs.getString("street")%>"/>
    <br/>
    Date : <input type="text" name="date" value="<%=rs.getDate("date")%>"/>
    <br>
    <%
}
int yp = 0;
String sql3 = "SELECT COUNT(name) as df FROM cart WHERE email = ?";
ps=con.prepareStatement(sql3);
ps.setString(1,um);
rs=ps.executeQuery();
while(rs.next())
{
    yp = rs.getInt("df");
}
        %>
        Quantity : <input type="number" name="qty" value="<%=yp%>"/>
        <input type="submit"/>
        <br>
        <br>
        <input type="submit" value="Delevered" formaction="delevered_orders"/>
         </form>
    </body>
    
</html>
