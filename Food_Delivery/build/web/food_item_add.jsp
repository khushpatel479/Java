<%-- 
    Document   : food_item_add
    Created on : 2 Aug, 2024, 4:57:39 PM
    Author     : Acer
--%>
<%@page import='java.sql.*'%>
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
            <div class="app">
        <form action="food_item_add" method="post" enctype="multipart/form-data">
            <div  class="form-group">
            <input  class="form-control" type="number" placeholder="Enter The Id" name="id"/>
            </div>
        <br>
            <div  class="form-group">
        <input class="form-control" type="text" placeholder="Enter The Name" name="name"/>
            </div>
        <br>
            <div  class="form-group">
        <input class="form-control" type="number" placeholder="Enter The Price" name="price"/>
            </div>
        <br>
            <div  class="form-group">
        <input class="form-control" type="text" placeholder="Enter The Description" name="dec"/>
            </div>
        <br>
            <div  class="form-group">
        <%
       
            Connection con = null;
            int id;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/food_project","root","");
            if(con!=null)
            {
                System.out.println("Connected");
            }
              Statement st;
            ResultSet rs ;
            String sql = "select * from explore_item";
            st=con.createStatement();
            rs=st.executeQuery(sql);
            %>
            <select class="form-control" name="exp_id">
            <%
            while(rs.next())
            {
                id = rs.getInt("id");
                %>
                
                    <option value="<%=id%>" ><%=rs.getString("name")%></option>
               
          
            <%
            }
            %>
            </select>
            </div>
            <br>
             <div  class="form-group">
            <input class="form-control"  type="file" name="img" />
             </div>
            <br>
            <input  class="btn btn-primary" type="submit" value="Insert-Data"/>
        </form>
            <br>
           
        </div>
      
    </body>
</html>
