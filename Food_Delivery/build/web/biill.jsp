<%-- 
    Document   : biill
    Created on : 15 Aug, 2024, 11:34:05 AM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    </head>
    <body>
        <%
            String fname = "";
            String lname = "";
            String email = "";
            String street = "";
            String state = "";
            int order_id = 0;
            int phone = 0;
            int zip_code = 0;
            String city = "";
            String country="";
            String uname = session.getAttribute("uname").toString();
            String lp = "";
          Connection con = null;
              Class.forName("com.mysql.jdbc.Driver");
              con = DriverManager.getConnection("jdbc:mysql://localhost/food_project","root","");
           String sql = "SELECT * FROM place_order WHERE email=?";
           PreparedStatement ps;
           ps = con.prepareStatement(sql);
           ps.setString(1,uname);
           ResultSet rs;
           rs=ps.executeQuery();
           if(rs.next())
           {
               fname = rs.getString("fname");
               lname = rs.getString("lname");
               state = rs.getString("state");
               street = rs.getString("street");
               city = rs.getString("city");
               order_id  = rs.getInt("order_id");
               phone = rs.getInt("phone");
               zip_code = rs.getInt("zipcode");
               country = rs.getString("country");
               email = rs.getString("email");
               lp = rs.getDate("date").toString();
           }
              
        %>
        
     <!-- Invoice 1 - Bootstrap Brain Component -->
<section class="py-3 py-md-5">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-12 col-lg-9 col-xl-8 col-xxl-7">
        <div class="row gy-3 mb-3">
          <div class="col-6">
            <h2 class="text-uppercase text-endx m-0">Invoice</h2>
          </div>
          <div class="col-6">
            <a class="d-block text-end" href="#!">
                <img src="./images/logo.png" class="img-fluid" alt="BootstrapBrain Logo" width="135" height="44">
            </a>
          </div>
          <div class="col-12">
            <h4>From</h4>
            <address>
              <strong>Uvi's Delight</strong><br>
           
              
             India<br>
              Phone:9123447977<br>
              Email: email@domain.com
            </address>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-12 col-sm-6 col-md-8">
            <h4>Bill To</h4>
            <address>
              <strong><%=fname%> <%=lname%></strong><br>
            <%=street%><br>
              <%=city%>, <%=state%>, <%=zip_code%><br>
              <%=country%><br>
              Phone: <%=phone%><br>
              Email: <%=email%>
            </address>
          </div>
          <div class="col-12 col-sm-6 col-md-4">
            <h4 class="row">
              <span class="col-6">Invoice</span>
             
            </h4>
            <div class="row">
             
              <!--<span class="col-6 text-sm-end">786-54984</span>-->
              <span class="col-6">Order ID</span>
              <span class="col-6 text-sm-end">#<%=order_id%></span>
              <span class="col-6">Invoice Date</span>
              <span class="col-6 text-sm-end"><%=lp%></span>
              
            </div>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-12">
            <div class="table-responsive">
              <table class="table table-striped">
                <thead>
                  <tr>
                   
                    <th scope="col" class="text-uppercase">Product</th>
                    <th scope="col" class="text-uppercase text-end">Unit Price</th>
                  
                  </tr>
                </thead>
                <tbody class="table-group-divider">
                  
                 <%
                     int qty = 0;
                     String sql2 = "SELECT COUNT(name) AS yu FROM cart WHERE email = ?";
                     ps = con.prepareStatement(sql2);
                     ps.setString(1, uname);
                     rs = ps.executeQuery();
                     if(rs.next())
                     {
                         qty = rs.getInt("yu");
                     }
                 String sql1 = "SELECT * FROM cart WHERE email = ?";
                 ps = con.prepareStatement(sql1);
                 ps.setString(1, uname);
                rs = ps.executeQuery();
                while(rs.next())
                {
                    
                    %>
                    <tr>
                   
                    <td><%=rs.getString("name")%></td>
                    <td class="text-end"><%=rs.getInt("price")%></td>
                  
                  </tr>
                    <%
                }
                   int tot=0;
                 String sql3 = "SELECT SUM(price) AS pr FROM cart WHERE email = ?";
                 ps = con.prepareStatement(sql3);
                 ps.setString(1, uname);
                 rs=ps.executeQuery();
                 if(rs.next())
                    {   
                            tot = rs.getInt("pr");
                       }
                 
                 %>
                </tbody>
              </table>
            </div>
                 <span class="col-6">Total Amount : </span>
              <span class="col-6 text-sm-end"><%=tot%>rs</span>
          </div>
        </div>
        <div class="row">
          <div class="col-12 text-end">
              <a href="Data_image/p1.jpg" download="bill.jsp"> <button type="submit" class="btn btn-primary mb-3">Download Invoice</button></a>
            <button type="submit" class="btn btn-danger mb-3">Submit Payment</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
    </body>
</html>
