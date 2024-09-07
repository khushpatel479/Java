<%-- 
    Document   : food_item_del
    Created on : 4 Aug, 2024, 7:27:31 PM
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
            <form action="food_item_del" method="post" >
            <div  class="form-group">
            <input  class="form-control" type="number" placeholder="Enter The Id" name="id"/>
            </div>
                <input  class="btn btn-primary" type="submit" value="Delete-Data"/>
            </form>
        </div>
    </body>
</html>
