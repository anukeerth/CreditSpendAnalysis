 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="icon" href="${pageContext.request.contextPath}/resources/theme/CSS/favicon.png" type="image/gif" sizes="50x50">  

<title>
    CreditCardAnalysis
</title>
 
   
   <!--    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"> -->
   
    
     <link href="${pageContext.request.contextPath}/resources/theme/CSS/style.css"
    rel="stylesheet">
     
<body>
<script>
    $(document).ready(function() {
        function disableBack() { window.history.forward() }

        window.onload = disableBack();
        window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
    });
</script>

        <h2 class="w3-center"></h2>
       
        
    <div class="loginbox">
     
        <img
        src="${pageContext.request.contextPath}/resources/theme/CSS/Q.png" class="avatar"/>
        <h1>STANDARD CHARTERED</h1>
        <form action="login" method="post">
            <p>Username</p>
            <input type="text" name="user" placeholder=" ">
            <p>Password</p>
            <input type="password" name="pass" placeholder=" ">
            <input type="submit"  value="Login">
           <h1>invalid credentials</h1>
        </form>
        
    </div>
</body>
</head>
</html>