<%--
  Created by IntelliJ IDEA.
  User: ycode
  Date: 13/10/2025
  Time: 22:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
<html>
<head>
    <title>Nurse Dashboard</title>
</head>
<body>
<h1 style="text-align: center">Patient Registration</h1>
<form action="${pageContext.request.contextPath}/nurseDashboard" class="form" method="post">
    <input type="text" name="firstname" placeholder="firstname" class="input"/>
    <input type="text" name="lastname" placeholder="lastname" class="input"/>
    <input type="text" name="email" placeholder="email" class="input"/>
    <input type="text" name="phone" placeholder="phone" class="input"/>
    <input type="date" name="dateOfBirth" class="input"/>
    <input type="text" name="securityNumber" placeholder="securityNumber" class="input"/>
    <input type="text" name="address" placeholder="address" class="input"/>
    <h2>Medical Data</h2>
    <input type="text" name="antecedents" placeholder="antecedents" class="input"/>
    <input type="text" name="allergies" placeholder="allergies" class="input"/>
    <input type="text" name="ongoingTreatment" placeholder="ongoingTreatment" class="input"/>
    <h2>Vital signs</h2>
    <input type="number" name="height" placeholder="height" class="input">
    <input type="number" name="weight" placeholder="weight" class="input">
    <input type="number" name="respiratoryRate" placeholder="respiratoryRate" class="input">
    <input type="number" name="bodyTemperature" placeholder="bodyTemperature" class="input">
    <input type="number" name="heartRate" placeholder="heartRate" class="input">
    <input type="number" name="bloodPressure" placeholder="bloodPressure" class="input">

    <button type="submit" style="height: 35px;background-color: black;color: white">Register</button>
</form>
</body>
</html>
