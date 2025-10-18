<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tableau de bord - Médecin Généraliste</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white min-h-screen">
<jsp:include page="/template/header.jsp" />
<!-- Header -->
<header class="bg-black text-white shadow-sm">
    <div class="max-w-7xl mx-auto px-6 py-4">
        <h1 class="text-2xl font-semibold">Tableau de bord - Médecin Généraliste</h1>
    </div>
</header>

<c:if test="${!sessionScope.containsKey('user')}">
    <jsp:forward page="/authentication/login.jsp"/>
</c:if>

<c:if test="${sessionScope.user.role != 'general_doctor'}">
    <jsp:forward page="/unauthorized.jsp"/>
</c:if>

<main class="max-w-7xl mx-auto px-6 py-8">

    <!-- Toggle Sections -->
    <div class="space-y-4">

        <!-- Patients Section -->
        <div class="bg-white border border-gray-200 rounded shadow-sm overflow-hidden">
            <!-- Section Header (Clickable) -->
            <button onclick="toggleSection('patients')"
                    class="w-full px-6 py-4 bg-gray-50 hover:bg-gray-100 transition-colors flex justify-between items-center border-b border-gray-200">
                <div class="flex items-center gap-3">
                    <h2 class="text-lg font-semibold text-gray-900">Patients en attente de consultation</h2>
                    <span id="patients-count" class="px-2.5 py-0.5 bg-black text-white text-xs font-medium rounded">
                        ${patients.size()}
                    </span>
                </div>
                <svg id="patients-icon" class="w-5 h-5 text-gray-600 transform transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>
                </svg>
            </button>

            <!-- Section Content -->
            <div id="patients-content" class="overflow-hidden">
                <table class="w-full">
                    <thead>
                    <tr class="bg-white border-b border-gray-200">
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
                                <form action="${pageContext.request.contextPath}/patient" method="get">
                                    <input type="hidden" name="patientId" value="${patient.id}">
                                    <button type="submit"
                                            class="px-4 py-1.5 bg-gray-50 text-gray-700 rounded border border-gray-200 hover:bg-gray-100 transition-colors text-xs font-medium">
                                        Consulter
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty patients}">
                        <tr>
                            <td colspan="8" class="px-6 py-12 text-center">
                                <div class="text-gray-400">
                                    <p class="text-sm">Aucun patient en attente</p>
                                </div>
                            </td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Expertise Requests Section -->
        <div class="bg-white border border-gray-200 rounded shadow-sm overflow-hidden">
            <!-- Section Header (Clickable) -->
            <button onclick="toggleSection('expertise')"
                    class="w-full px-6 py-4 bg-gray-50 hover:bg-gray-100 transition-colors flex justify-between items-center border-b border-gray-200">
                <div class="flex items-center gap-3">
                    <h2 class="text-lg font-semibold text-gray-900">Demandes d'expertise</h2>
                    <span id="expertise-count" class="px-2.5 py-0.5 bg-black text-white text-xs font-medium rounded">
                        ${expertiseRequests.size()}
                    </span>
                </div>
                <svg id="expertise-icon" class="w-5 h-5 text-gray-600 transform transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>
                </svg>
            </button>

            <!-- Section Content -->
            <div id="expertise-content" class="overflow-hidden hidden">
                <table class="w-full">
                    <thead>
                    <tr class="bg-white border-b border-gray-200">
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                            Patient
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                            Médecin demandeur
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                            Spécialité requise
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                            Date demande
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                            Statut
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                            Actions
                        </th>
                    </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                    <c:forEach var="request" items="${expertiseRequests}">
                        <tr class="hover:bg-gray-50 transition-colors">
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                    ${request.patientName}
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                    ${request.requestingDoctor}
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                    ${request.specialtyRequired}
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">
                                    ${request.requestDate}
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm">
                                    <span class="px-2.5 py-1 rounded text-xs font-medium
                                        ${request.status == 'En attente' ? 'bg-gray-100 text-gray-700' : ''}
                                        ${request.status == 'En cours' ? 'bg-gray-800 text-white' : ''}
                                        ${request.status == 'Complété' ? 'bg-gray-200 text-gray-900' : ''}">
                                            ${request.status}
                                    </span>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm">
                                <div class="flex gap-2">
                                    <a href="#"
                                       class="px-3 py-1.5 bg-gray-50 text-gray-700 rounded border border-gray-200 hover:bg-gray-100 transition-colors text-xs font-medium">
                                        Voir
                                    </a>
                                    <a href="#"
                                       class="px-3 py-1.5 bg-gray-100 text-gray-700 rounded border border-gray-200 hover:bg-gray-200 transition-colors text-xs font-medium">
                                        Traiter
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty expertiseRequests}">
                        <tr>
                            <td colspan="6" class="px-6 py-12 text-center">
                                <div class="text-gray-400">
                                    <p class="text-sm">Aucune demande d'expertise</p>
                                </div>
                            </td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</main>

<!-- Toggle Script -->
<script>
    function toggleSection(section) {
        const content = document.getElementById(section + '-content');
        const icon = document.getElementById(section + '-icon');

        if (content.classList.contains('hidden')) {
            content.classList.remove('hidden');
            icon.classList.add('rotate-180');
        } else {
            content.classList.add('hidden');
            icon.classList.remove('rotate-180');
        }
    }

    // Open patients section by default
    document.addEventListener('DOMContentLoaded', function() {
        const patientsIcon = document.getElementById('patients-icon');
        patientsIcon.classList.add('rotate-180');
    });
</script>

<jsp:include page="/template/footer.jsp" />
</body>
</html>