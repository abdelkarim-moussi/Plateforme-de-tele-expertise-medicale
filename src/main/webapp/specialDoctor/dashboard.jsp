<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tableau de bord - Médecin Spécialiste</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white min-h-screen">
<!-- Header -->
<jsp:include page="/template/header.jsp"/>

<header class="bg-black text-white shadow-sm">
    <div class="max-w-7xl mx-auto px-6 py-4">
        <h1 class="text-2xl font-semibold">Tableau de bord - Médecin Spécialiste</h1>
        <p class="text-sm text-gray-300 mt-1">Spécialité: ${doctor.specialty}</p>
    </div>
</header>

<!-- Main Content -->
<main class="max-w-7xl mx-auto px-6 py-8">

    <!-- Toggle Sections -->
    <div class="space-y-4">

        <!-- Demandes d'Expertise Section -->
        <div class="bg-white border border-gray-200 rounded shadow-sm overflow-hidden">
            <!-- Section Header (Clickable) -->
            <button onclick="toggleSection('expertise')"
                    class="w-full px-6 py-4 bg-gray-50 hover:bg-gray-100 transition-colors flex justify-between items-center border-b border-gray-200">
                <div class="flex items-center gap-3">
                    <h2 class="text-lg font-semibold text-gray-900">Demandes d'expertise en attente</h2>
                    <span id="expertise-count" class="px-2.5 py-0.5 bg-black text-white text-xs font-medium rounded">
                        ${expertiseRequests.size()}
                    </span>
                </div>
                <svg id="expertise-icon" class="w-5 h-5 text-gray-600 transform transition-transform rotate-180" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>
                </svg>
            </button>

            <!-- Section Content -->
            <div id="expertise-content" class="overflow-hidden">
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
                            Question posée
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                            Priorité
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                            Date demande
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                            Type
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
                                Dr. ${request.requestingDoctor}
                            </td>
                            <td class="px-6 py-4 text-sm text-gray-900 max-w-xs truncate">
                                    ${request.question}
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm">
                                    <span class="px-2.5 py-1 rounded text-xs font-medium
                                        ${request.priority == 'URGENTE' ? 'bg-gray-900 text-white' : ''}
                                        ${request.priority == 'NORMALE' ? 'bg-gray-100 text-gray-900' : ''}
                                        ${request.priority == 'NON URGENTE' ? 'bg-gray-50 text-gray-700 border border-gray-200' : ''}">
                                            ${request.priority}
                                    </span>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">
                                    ${request.requestDate}
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm">
                                    <span class="px-2.5 py-1 rounded text-xs font-medium
                                        ${request.type == 'SYNCHRONE' ? 'bg-gray-800 text-white' : 'bg-gray-100 text-gray-900'}">
                                            ${request.type}
                                    </span>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm">
                                <div class="flex gap-2">
                                    <a href="${pageContext.request.contextPath}/expertise/${request.id}"
                                       class="px-3 py-1.5 bg-gray-50 text-gray-700 rounded border border-gray-200 hover:bg-gray-100 transition-colors text-xs font-medium">
                                        Voir détails
                                    </a>
                                    <a href="${pageContext.request.contextPath}/expertise/${request.id}/respond"
                                       class="px-3 py-1.5 bg-gray-100 text-gray-700 rounded border border-gray-200 hover:bg-gray-200 transition-colors text-xs font-medium">
                                        Répondre
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty expertiseRequests}">
                        <tr>
                            <td colspan="7" class="px-6 py-12 text-center">
                                <div class="text-gray-400">
                                    <p class="text-sm">Aucune demande d'expertise en attente</p>
                                </div>
                            </td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Expertises Traitées Section -->
        <div class="bg-white border border-gray-200 rounded shadow-sm overflow-hidden">
            <!-- Section Header (Clickable) -->
            <button onclick="toggleSection('completed')"
                    class="w-full px-6 py-4 bg-gray-50 hover:bg-gray-100 transition-colors flex justify-between items-center border-b border-gray-200">
                <div class="flex items-center gap-3">
                    <h2 class="text-lg font-semibold text-gray-900">Expertises traitées</h2>
                    <span id="completed-count" class="px-2.5 py-0.5 bg-black text-white text-xs font-medium rounded">
                        ${completedExpertises.size()}
                    </span>
                </div>
                <svg id="completed-icon" class="w-5 h-5 text-gray-600 transform transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>
                </svg>
            </button>

            <!-- Section Content -->
            <div id="completed-content" class="overflow-hidden hidden">
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
                            Question
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                            Date traitement
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                            Avis donné
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                            Actions
                        </th>
                    </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                    <c:forEach var="expertise" items="${completedExpertises}">
                        <tr class="hover:bg-gray-50 transition-colors">
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                    ${expertise.patientName}
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                Dr. ${expertise.requestingDoctor}
                            </td>
                            <td class="px-6 py-4 text-sm text-gray-900 max-w-xs truncate">
                                    ${expertise.question}
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">
                                    ${expertise.completedDate}
                            </td>
                            <td class="px-6 py-4 text-sm text-gray-900 max-w-xs truncate">
                                    ${expertise.advice}
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm">
                                <a href="${pageContext.request.contextPath}/expertise/${expertise.id}"
                                   class="px-3 py-1.5 bg-gray-50 text-gray-700 rounded border border-gray-200 hover:bg-gray-100 transition-colors text-xs font-medium">
                                    Consulter
                                </a>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty completedExpertises}">
                        <tr>
                            <td colspan="6" class="px-6 py-12 text-center">
                                <div class="text-gray-400">
                                    <p class="text-sm">Aucune expertise traitée</p>
                                </div>
                            </td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Mes Créneaux Section -->
        <div class="bg-white border border-gray-200 rounded shadow-sm overflow-hidden">
            <!-- Section Header (Clickable) -->
            <button onclick="toggleSection('schedule')"
                    class="w-full px-6 py-4 bg-gray-50 hover:bg-gray-100 transition-colors flex justify-between items-center border-b border-gray-200">
                <div class="flex items-center gap-3">
                    <h2 class="text-lg font-semibold text-gray-900">Mes créneaux de disponibilité</h2>
                    <span class="px-2.5 py-0.5 bg-black text-white text-xs font-medium rounded">
                            Gérer
                        </span>
                </div>
                <svg id="schedule-icon" class="w-5 h-5 text-gray-600 transform transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>
                </svg>
            </button>

            <!-- Section Content -->
            <div id="schedule-content" class="overflow-hidden hidden">
                <div class="p-6">
                    <div class="flex justify-between items-center mb-4">
                        <p class="text-sm text-gray-600">Gérez vos disponibilités pour les télé-expertises</p>
                        <a href="${pageContext.request.contextPath}/schedule/add"
                           class="px-4 py-2 bg-black text-white rounded hover:bg-gray-800 transition-colors shadow-sm text-sm font-medium">
                            + Ajouter un créneau
                        </a>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                        <c:forEach var="slot" items="${availableSlots}">
                            <div class="bg-gray-50 rounded border border-gray-200 p-4">
                                <div class="flex justify-between items-start mb-2">
                                    <div>
                                        <div class="text-sm font-semibold text-gray-900">${slot.date}</div>
                                        <div class="text-xs text-gray-600 mt-1">${slot.startTime} - ${slot.endTime}</div>
                                    </div>
                                    <span class="px-2 py-1 rounded text-xs font-medium
                                        ${slot.status == 'DISPONIBLE' ? 'bg-gray-100 text-gray-900' : ''}
                                        ${slot.status == 'RESERVE' ? 'bg-gray-800 text-white' : ''}
                                        ${slot.status == 'PASSE' ? 'bg-gray-200 text-gray-600' : ''}">
                                            ${slot.status}
                                    </span>
                                </div>
                                <c:if test="${slot.status == 'DISPONIBLE'}">
                                    <div class="flex gap-2 mt-3 pt-3 border-t border-gray-200">
                                        <button class="px-2 py-1 bg-gray-100 text-gray-700 rounded text-xs hover:bg-gray-200 transition-colors">
                                            Modifier
                                        </button>
                                        <button class="px-2 py-1 bg-gray-50 text-gray-700 rounded border border-gray-200 text-xs hover:bg-gray-100 transition-colors">
                                            Supprimer
                                        </button>
                                    </div>
                                </c:if>
                            </div>
                        </c:forEach>

                        <c:if test="${empty availableSlots}">
                            <div class="md:col-span-2 lg:col-span-3 py-12 text-center text-gray-400">
                                <p class="text-sm">Aucun créneau configuré</p>
                            </div>
                        </c:if>
                    </div>
                </div>
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

    // Open expertise section by default
    document.addEventListener('DOMContentLoaded', function() {
        const expertiseIcon = document.getElementById('expertise-icon');
        expertiseIcon.classList.add('rotate-180');
    });
</script>
</body>

<jsp:include page="/template/footer.jsp"/>
</html>