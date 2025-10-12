<%--
  Created by IntelliJ IDEA.
  User: ycode
  Date: 08/10/2025
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h1>Login form</h1>
<form action="${pageContext.request.contextPath}/login" method="post">
    <input type="text" name="email" placeholder="email">
    <input type="password" name="password" placeholder="password">
    <button type="submit">login</button>
</form>

<div>${errors}</div>

</body>
</html>
