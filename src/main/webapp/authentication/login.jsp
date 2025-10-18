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
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        purple: {
                            600: '#7c3aed',
                            700: '#6d28d9',
                        }
                    }
                }
            }
        }
    </script>
</head>
<body>
<h1 style="text-align: center">Login form</h1>
<form action="${pageContext.request.contextPath}/login" method="post" style="display: flex;flex-direction: column; gap: 5px;;width: 300px; margin: auto">
    <input type="text" name="email" placeholder="email" style="padding-inline: 2px; height: 30px" >
    <input type="password" name="password" placeholder="password" style="padding-inline: 2px; height: 30px">
    <button type="submit" style="height: 30px; background-color: #000; color: #fff;border-radius: 2px">Login</button>
</form>

<div>${errors}</div>

</body>
</html>
