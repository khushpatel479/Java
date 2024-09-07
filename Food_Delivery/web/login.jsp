<%-- 
    Document   : login
    Created on : 3 Aug, 2024, 8:26:40 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" >
        <link rel="stylesheet" href="login.css">
    </head>
    <body>
        <div class="container">
        <div class="wrapper d-flex align-items-center justify-content-center h-100">
            <div class="card login-form">
                <div class="card-body">
                    <h5 class="card-title text-center">Login Here</h5>
                    <form action="login" method="post">
                       
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" id="exampleInputEmail1"
                                aria-describedby="emailHelp">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Password</label>
                            <input type="password" name="pass" class="form-control" id="exampleInputPassword1">
                        </div>
                        
                        <button type="submit" class="btn btn-primary w-100">Submit</button>
                        <div class="sign-up mt-4">
                            Don't have an account? <a href="login.jsp">Login</a>
                        </div>
                              <div class="sign-up mt-4">
                            Don't have an account? <a href="signup.jsp">Create One</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </body>
</html>
