<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tableau de bord Infirmière</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white min-h-screen">

<jsp:include page="/template/header.jsp" />
<!-- Header -->
<header class="bg-black text-white shadow-sm">
    <div class="max-w-7xl mx-auto px-6 py-4">
        <h1 class="text-2xl font-semibold">Tableau de bord Infirmière</h1>
    </div>
</header>

<c:if test="${!sessionScope.containsKey('user')}">
    <jsp:forward page="/authentication/login.jsp"/>
</c:if>

<c:if test="${sessionScope.user.role != 'nurse'}">
    <jsp:forward page="/unauthorized.jsp"/>
</c:if>

<main class="max-w-7xl mx-auto px-6 py-8">
    <!-- Action Bar -->
    <div class="mb-6 flex justify-between items-center">
        <div>
            <p class="text-gray-600">Gérer les patients et leurs informations</p>
        </div>
        <a href="${pageContext.request.contextPath}/registerPatient"
           class="inline-block bg-black text-white px-6 py-2.5 rounded hover:bg-gray-800 transition-colors shadow-sm">
            + Ajouter un nouveau patient
        </a>
    </div>

    <!-- Patients Table -->
    <div class="bg-white border border-gray-200 rounded shadow-sm overflow-hidden">
        <table class="w-full">
            <thead>
            <tr class="bg-gray-50 border-b border-gray-200">
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                    Nom
                </th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                    Prénom
                </th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                    Date de naissance
                </th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                    Email
                </th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                    Numéro SS
                </th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                    Téléphone
                </th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                    Temp D'arriver
                </th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                    Actions
                </th>
            </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-200">
            <c:forEach var="patient" items="${patients}">
                <tr class="hover:bg-gray-50 transition-colors">
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                            ${patient.firstName}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                            ${patient.lastName}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                            ${patient.dateOfBirth}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">
                            ${patient.email}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                            ${patient.socialSecurityNumber}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                            ${patient.phone}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">
                            ${patient.arrivalTime}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm">
                        <div class="flex gap-2">
                            <a href="#"
                               class="px-3 py-1.5 bg-gray-50 text-gray-700 rounded border border-gray-200 hover:bg-gray-100 transition-colors text-xs font-medium">
                                Voir
                            </a>
                            <a href="#"
                               class="px-3 py-1.5 bg-gray-100 text-gray-700 rounded border border-gray-200 hover:bg-gray-200 transition-colors text-xs font-medium">
                                Modifier
                            </a>
                        </div>
                    </td>
                </tr>
            </c:forEach>

            <!-- Empty state (if no patients) -->
            <c:if test="${empty patients}">
                <tr>
                    <td colspan="8" class="px-6 py-12 text-center">
                        <div class="text-gray-400">
                            <p class="text-sm">Aucun patient enregistré</p>
                            <p class="text-xs mt-1">Commencez par ajouter un nouveau patient</p>
                        </div>
                    </td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>

    <!-- Table Footer Info -->
    <div class="mt-4 flex justify-between items-center text-sm text-gray-600">
        <p>Total: <span class="font-medium text-gray-900">${patients.size()}</span> patient(s)</p>
    </div>
</main>

<jsp:include page="/template/footer.jsp" />
</body>
</html>