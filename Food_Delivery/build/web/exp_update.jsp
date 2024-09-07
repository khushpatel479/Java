<%-- 
    Document   : exp_update
    Created on : 4 Aug, 2024, 5:34:20 PM
    Author     : Acer
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
 <link rel="stylesheet" href="exp_menu_add.css">
    </head>
      
    <body>
        <%
             int id = 0;
             String vname ="";
             String vimag = "";
             String hj = request.getParameter("id");
             int pid = Integer.parseInt(hj);
             Connection con = null;
             String im="";
             Class.forName("com.mysql.jdbc.Driver");
             con = DriverManager.getConnection("jdbc:mysql://localhost/food_project","root","");
             if(con!=null)
             {
                 System.out.println("ok");
             }
             ResultSet rs;
             PreparedStatement ps;
             String sql = "select * from explore_item where id=?";
             ps = con.prepareStatement(sql);
             ps.setInt(1, pid);
            
             rs = ps.executeQuery();
             if(rs.next())
             {
                 id = rs.getInt(1);
                 vname = rs.getString(2);
                 vimag = rs.getString(3);
             }
             %>
        <div class="app">
 <form action="exp_update" enctype="multipart/form-data" method="post">
             <div class="form-group">
            <input type="number" class="form-control" value="<%=pid%>"  name="id" placeholder="Enter The Id"/>
             </div> 
            <br>
               <div class="form-group">
            <input type="text" class="form-control" value="<%=vname%>" name="name" placeholder="Enter The Name"/>
               </div>
        <br>
           <div class="form-group">
        <input  type="file" class="form-control" name="img"/>
           </div>
        <br>
        <input type="submit" class="btn btn-primary" value="Update-Data" />
        </form>     
               <br>
               <a href="exp_del?id=<%=pid%>"><input type="button" class="btn btn-primary" value="Delete" /></a>
        </div>
    </body>
</html>
