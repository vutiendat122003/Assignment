<%-- 
    Document   : login
    Created on : Jun 22, 2024, 4:33:30 PM
    Author     : Vanxuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="${pageContext.request.contextPath}/file/text/basic.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <form action="login" method="POST" class="login-form">
           <label for="username">Username:</label>
           <input type="text" id="username" name="username"/><br/>
           <label for="password">Password:</label>
           <input type="password" id="password" name="password"/> <br/>           
           <input type="submit" value="Login"/>
           <label>
               <input type="checkbox" name="remember" value="remember"/> Remember for 1 week!
           </label>
           <div class="redText">
               ${requestScope.error}
           </div>
        </form>
    </body>
</html>
