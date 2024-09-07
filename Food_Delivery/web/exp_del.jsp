<%-- 
    Document   : exp_del
    Created on : 4 Aug, 2024, 5:56:40 PM
    Author     : Acer
--%>

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
        <div class="app">
            <form action="exp_del"  method="post">
             <div class="form-group">
            <input type="number" class="form-control"  name="id" placeholder="Enter The Id"/>
             </div> 
         
        <input type="submit" class="btn btn-primary" value="Delete" />
        </form>
            
        </div>
    </body>
</html>
