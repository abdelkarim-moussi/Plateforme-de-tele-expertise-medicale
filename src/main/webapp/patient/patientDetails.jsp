<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dossier Medical Patient</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white min-h-screen">
<jsp:include page="/template/header.jsp"/>
<!-- Header -->
<header class="bg-black text-white shadow-sm">
    <div class="max-w-7xl mx-auto px-6 py-4">
        <h1 class="text-2xl font-semibold">
            Dossier Médical - ${patient.firstName} ${patient.lastName}
        </h1>
        <p class="text-sm text-gray-300 mt-1">Informations complètes du patient</p>
    </div>
</header>

<!-- Main Content -->
<main class="max-w-7xl mx-auto px-6 py-8">

    <!-- Patient Information Card -->
    <div class="bg-white border border-gray-200 rounded shadow-sm overflow-hidden mb-6">
        <div class="p-6 space-y-8">

            <!-- Informations Personnelles -->
            <section>
                <h3 class="text-sm font-semibold text-gray-900 uppercase tracking-wide mb-4 pb-2 border-b border-gray-200">
                    Informations Personnelles
                </h3>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
                    <div class="bg-gray-50 rounded border border-gray-200 p-4">
                        <div class="text-xs font-medium text-gray-600 uppercase tracking-wide mb-1">Nom</div>
                        <div class="text-sm font-semibold text-gray-900" id="firstName">${patient.firstName}</div>
                    </div>
                    <div class="bg-gray-50 rounded border border-gray-200 p-4">
                        <div class="text-xs font-medium text-gray-600 uppercase tracking-wide mb-1">Prénom</div>
                        <div class="text-sm font-semibold text-gray-900" id="lastName">${patient.lastName}</div>
                    </div>
                    <div class="bg-gray-50 rounded border border-gray-200 p-4">
                        <div class="text-xs font-medium text-gray-600 uppercase tracking-wide mb-1">Date de naissance</div>
                        <div class="text-sm font-semibold text-gray-900" id="dateOfBirth">${patient.dateOfBirth}</div>
                    </div>
                    <div class="bg-gray-50 rounded border border-gray-200 p-4">
                        <div class="text-xs font-medium text-gray-600 uppercase tracking-wide mb-1">Numéro Sécurité Sociale</div>
                        <div class="text-sm font-semibold text-gray-900" id="socialSecurityNumber">${patient.socialSecurityNumber}</div>
                    </div>
                </div>
            </section>

            <!-- Données Médicales -->
            <section>
                <h3 class="text-sm font-semibold text-gray-900 uppercase tracking-wide mb-4 pb-2 border-b border-gray-200">
                    Données Médicales
                </h3>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div class="bg-gray-50 rounded border border-gray-200 p-4">
                        <div class="text-xs font-medium text-gray-600 uppercase tracking-wide mb-2">Antécédents</div>
                        <div class="text-sm text-gray-900" id="antecedents">
                            <c:choose>
                                <c:when test="${not empty patient.medicalData.antecedents}">
                                    ${patient.medicalData.antecedents}
                                </c:when>
                                <c:otherwise>
                                    <span class="text-gray-500">Aucun antécédent enregistré</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="bg-gray-50 rounded border border-gray-200 p-4">
                        <div class="text-xs font-medium text-gray-600 uppercase tracking-wide mb-2">Allergies</div>
                        <div class="text-sm text-gray-900" id="allergies">
                            <c:choose>
                                <c:when test="${not empty patient.medicalData.allergies}">
                                    ${patient.medicalData.allergies}
                                </c:when>
                                <c:otherwise>
                                    <span class="text-gray-500">Aucune allergie connue</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="bg-gray-50 rounded border border-gray-200 p-4 md:col-span-2">
                        <div class="text-xs font-medium text-gray-600 uppercase tracking-wide mb-2">Traitements en cours</div>
                        <div class="text-sm text-gray-900" id="ongoingTreatment">
                            <c:choose>
                                <c:when test="${not empty patient.medicalData.ongoingTreatment}">
                                    ${patient.medicalData.ongoingTreatment}
                                </c:when>
                                <c:otherwise>
                                    <span class="text-gray-500">Aucun traitement en cours</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Signes Vitaux -->
            <section>
                <h3 class="text-sm font-semibold text-gray-900 uppercase tracking-wide mb-4 pb-2 border-b border-gray-200">
                    Signes Vitaux
                </h3>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                    <div class="bg-gray-50 rounded border border-gray-200 p-4">
                        <div class="text-xs font-medium text-gray-600 uppercase tracking-wide mb-1">Taille</div>
                        <div class="text-sm font-semibold text-gray-900" id="height">
                            <c:choose>
                                <c:when test="${not empty patient.vitalSigns.height}">
                                    ${patient.vitalSigns.height} cm
                                </c:when>
                                <c:otherwise>
                                    <span class="text-gray-500">-</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="bg-gray-50 rounded border border-gray-200 p-4">
                        <div class="text-xs font-medium text-gray-600 uppercase tracking-wide mb-1">Poids</div>
                        <div class="text-sm font-semibold text-gray-900" id="weight">
                            <c:choose>
                                <c:when test="${not empty patient.vitalSigns.weight}">
                                    ${patient.vitalSigns.weight} kg
                                </c:when>
                                <c:otherwise>
                                    <span class="text-gray-500">-</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="bg-gray-50 rounded border border-gray-200 p-4">
                        <div class="text-xs font-medium text-gray-600 uppercase tracking-wide mb-1">Fréquence respiratoire</div>
                        <div class="text-sm font-semibold text-gray-900" id="respiratoryRate">
                            <c:choose>
                                <c:when test="${not empty patient.vitalSigns.respiratoryRate}">
                                    ${patient.vitalSigns.respiratoryRate} resp/min
                                </c:when>
                                <c:otherwise>
                                    <span class="text-gray-500">-</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="bg-gray-50 rounded border border-gray-200 p-4">
                        <div class="text-xs font-medium text-gray-600 uppercase tracking-wide mb-1">Température corporelle</div>
                        <div class="text-sm font-semibold text-gray-900" id="bodyTemperature">
                            <c:choose>
                                <c:when test="${not empty patient.vitalSigns.bodyTemperature}">
                                    ${patient.vitalSigns.bodyTemperature} °C
                                </c:when>
                                <c:otherwise>
                                    <span class="text-gray-500">-</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="bg-gray-50 rounded border border-gray-200 p-4">
                        <div class="text-xs font-medium text-gray-600 uppercase tracking-wide mb-1">Fréquence cardiaque</div>
                        <div class="text-sm font-semibold text-gray-900" id="heartRate">
                            <c:choose>
                                <c:when test="${not empty patient.vitalSigns.heartRate}">
                                    ${patient.vitalSigns.heartRate} bpm
                                </c:when>
                                <c:otherwise>
                                    <span class="text-gray-500">-</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="bg-gray-50 rounded border border-gray-200 p-4">
                        <div class="text-xs font-medium text-gray-600 uppercase tracking-wide mb-1">Tension artérielle</div>
                        <div class="text-sm font-semibold text-gray-900" id="bloodPressure">
                            <c:choose>
                                <c:when test="${not empty patient.vitalSigns.bloodPressure}">
                                    ${patient.vitalSigns.bloodPressure} mmHg
                                </c:when>
                                <c:otherwise>
                                    <span class="text-gray-500">-</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </section>

        </div>
    </div>

    <!-- Action Button -->
    <div class="flex justify-center">
        <form action="${pageContext.request.contextPath}/consultation" method="get">
            <input type="hidden" name="patientId" value="${patient.id}" />
            <button
                    type="submit"
                    class="px-8 py-3 bg-black text-white rounded hover:bg-gray-800 transition-colors shadow-sm font-medium"
            >
                Créer une consultation
            </button>
        </form>
    </div>

</main>

<jsp:include page="/template/footer.jsp"/>
</body>
</html>