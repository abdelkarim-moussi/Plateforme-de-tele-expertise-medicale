<%--
  Created by IntelliJ IDEA.
  User: ycode
  Date: 08/10/2025
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign Up</title>
</head>
<body>
<h1>Staph registration form</h1>
<form action="${pageContext.request.contextPath}/signup" method="post">
    <input type="text" name="first_name" placeholder="firstname">
    <input type="text" name="last_name" placeholder="lastname">
    <input type="text" name="email" placeholder="email">
    <input type="text" name="phone" placeholder="phone">
    <input type="text" name="role" placeholder="role">
    <button type="submit">register</button>
</form>

<div>
  ${errors}
</div>
</body>
</html>
