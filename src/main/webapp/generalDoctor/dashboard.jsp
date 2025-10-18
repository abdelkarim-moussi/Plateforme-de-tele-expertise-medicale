<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tableau de bord - Médecin Généraliste</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
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
<div class="container">
    <h1>Tableau de bord - Médecin Généraliste</h1>
    <h2>Patients en attente de consultation</h2>

    <table>
        <thead>
        <tr>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Date de naissance</th>
            <th>Email</th>
            <th>Numéro de sécurité sociale</th>
            <th>Téléphone</th>
            <th>Temp D'arriver</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <!-- Example dummy data -->
        <c:forEach var="patient" items="${patients}">
            <tr>
                <td>${patient.firstName}</td>
                <td>${patient.lastName}</td>
                <td>${patient.dateOfBirth}</td>
                <td>${patient.email}</td>
                <td>${patient.socialSecurityNumber}</td>
                <td>${patient.phone}</td>
                <td>${patient.arrivalTime}</td>
                <td>
                    <form action="${pageContext.request.contextPath}/patient" method="get">
                        <input type="hidden" name="patientId" value="${patient.id}">
                        <button type="submit" class="btn btn-view">Consulter</button>
                    </form>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>
</body>
</html>
