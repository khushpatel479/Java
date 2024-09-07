<%-- 
    Document   : Explore_menu_add
    Created on : 2 Aug, 2024, 10:27:59 AM
    Author     : Acer
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
 <link rel="stylesheet" href="exp_menu_add.css">
 
    </head>
    <div class="app">
    <body>
       
        <form action="Explore_menu" enctype="multipart/form-data" method="post">
             <div class="form-group">
                 <input type="number"  class="form-control"  name="id" placeholder="Enter The Id For Updat-Data"/>
             </div> 
            <br>
               <div class="form-group">
                   <input type="text" class="form-control"  name="name" placeholder="Enter The Name"/>
               </div>
        <br>
           <div class="form-group">
               <input  type="file" class="form-control" name="img"/>
           </div>
        <input type="submit" class="btn btn-primary" value="Add" />
                </form>
        <br>
        
        <br>
        <a href="exp_del.jsp"><input type="submit"  class="btn btn-primary" value="Delete-Data" /></a>
        <br><br><br>
         <a href="exp_update.jsp"><button class="btn btn-primary">Update-Data</button></a>
     

       
<!--<form action="Explore_menu" method="post" enctype="multipart/form-data">
    <div class="form-group">
    <label for="exampleInputPassword1">Enter The Id For Update Or Delete Data</label>
    <input type="number" class="form-control" name="img" name="id" id="exampleInputPassword1" placeholder="Enter The Id For Update Or Delete Data"/>
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Enter The Name</label>
    <input type="text" class="form-control" name="name" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter The Name"/>
  
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Select Here</label>
    <input type="file" class="form-control" name="img" id="exampleInputPassword1"/>
  </div>
  
  <input type="submit" class="btn btn-primary"/>
  
  
</form>
<a href="exp_update"><button class="btn btn-primary">Update</button></a>-->
    </div>
    </body>
</html>
