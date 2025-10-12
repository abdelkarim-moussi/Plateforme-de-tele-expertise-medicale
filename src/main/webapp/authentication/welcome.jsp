<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<html>
<head>
    <title>Welcome</title>
</head>
<body>

<h1>Welcome</h1>

<p>Email: ${sessionScope.email}</p>

<!-- Optional: Logout link -->
<a href="logout">Logout</a>

</body>
</html>
