<%-- 
    Document   : food_list_update
    Created on : 4 Aug, 2024, 6:46:15 PM
    Author     : Acer
--%>
<%@page import='java.sql.*'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
 <link rel="stylesheet" href="exp_menu_add.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     <body>
        <%
          Connection con = null;
           String ip = request.getParameter("id");
       int y=0;
       String name="";
       int yl = 0;
       String dc = "";
       int id1 = Integer.parseInt(ip);
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/food_project","root","");
            if(con!=null)
            {
                System.out.println("Connected");
            }
              Statement st;
              PreparedStatement ps;
            ResultSet rs ;
               String sql1 = "SELECT * FROM food_items WHERE id = ?";
                 
            ps=con.prepareStatement(sql1);
            ps.setInt(1, id1);
            rs=ps.executeQuery();
                    if(rs.next())
        {
            y = rs.getInt("id");
            name = rs.getString("name");
            yl = rs.getInt("price");
            dc = rs.getString("description");
        }
        %>
        
        <div class="app">
        <form action="food_list_update" method="post" enctype="multipart/form-data">
            <div  class="form-group">
                <input  class="form-control" type="number" value="<%=y%>"  placeholder="Enter The Id" name="id"/>
            </div>
        <br>
            <div  class="form-group">
                <input class="form-control" type="text" value="<%=name%>" placeholder="Enter The Name" name="name"/>
            </div>
        <br>
            <div  class="form-group">
                <input class="form-control" type="number" value="<%=yl%>" placeholder="Enter The Price" name="price"/>
            </div>
        <br>
            <div  class="form-group">
                <input class="form-control" type="text" value="<%=dc%>" placeholder="Enter The Description" name="dec"/>
            </div>
        <br>
            <div  class="form-group">
        <%
     
             int id;
            String sql = "select * from explore_item";
       
            rs = ps.executeQuery();
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
          
        </form>
            <br>
            <a href="food_list_update.jsp"><button  class="btn btn-primary">Update-Data</button></a>
            <br>
            <br>
            <a href="food_item_del?id=<%=y%>">  <button class="btn btn-primary">Delete</button></a>
            <br>
          
        </div>
    </body>
</html>
