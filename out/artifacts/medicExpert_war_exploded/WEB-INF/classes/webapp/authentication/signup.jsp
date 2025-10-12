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
    <title>Staph Registration</title>
</head>
<body>
<h1 style="text-align: center">Staph registration form</h1>
<form action="${pageContext.request.contextPath}/signup" method="post" style="display: flex;flex-direction: column; gap: 5px;width: 300px; margin: auto">
    <input type="text" name="firstname" placeholder="firstname" style="padding-inline: 2px; height: 30px">
    <input type="text" name="lastname" placeholder="lastname" style="padding-inline: 2px; height: 30px">
    <input type="text" name="email" placeholder="email" style="padding-inline: 2px; height: 30px">
    <input type="text" name="phone" placeholder="phone" style="padding-inline: 2px; height: 30px">
    <select name="role" style="padding-inline: 2px; height: 30px">
        <option value="general_doctor">general doctor</option>
        <option value="special_doctor">special doctor</option>
        <option value="nurse">nurse</option>
    </select>
    <input type="password" name="password" placeholder="password" style="padding-inline: 2px; height: 30px">
    <button type="submit" style="height: 30px; background-color: #000; color: #fff;border-radius: 2px">register</button>
</form>

<div>
${errors}
</div>
</body>
</html>
