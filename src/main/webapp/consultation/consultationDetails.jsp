<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Consultation Médicale</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white min-h-screen">


<c:if test="${!sessionScope.containsKey('user')}">
    <jsp:forward page="/authentication/login.jsp"/>
</c:if>

<c:if test="${sessionScope.user.role != 'general_doctor'}">
    <jsp:forward page="/unauthorized.jsp"/>
</c:if>

<jsp:include page="/template/header.jsp" />

<header class="bg-black text-white shadow-sm">
    <div class="max-w-5xl mx-auto px-6 py-4 flex justify-between items-center">
        <div>
            <h1 class="text-2xl font-semibold">Consultation Médicale</h1>
            <p class="text-sm text-gray-300 mt-1">
                Patient: <span class="font-medium">${patient.firstName} ${patient.lastName}</span> |
                Âge: ${patient.dateOfBirth} ans |
                ID: ${consultation.id}
            </p>
        </div>
        <span class="px-3 py-1.5 rounded text-xs font-medium bg-gray-100 text-gray-900 border border-gray-200">
            ${consultation.status}
        </span>
    </div>
</header>

<!-- Main Content -->
<main class="max-w-5xl mx-auto px-6 py-8">
    <div class="bg-white border border-gray-200 rounded shadow-sm p-8">
        <form action="${pageContext.request.contextPath}/consultation" method="post" class="space-y-6">

            <!-- Hidden Fields -->
            <input type="hidden" name="patientId" value="${patient.id}">
            <input type="hidden" name="consultationId" value="${consultation.id}">

            <!-- Header -->
            <div class="pb-4 border-b border-gray-200">
                <h2 class="text-xl font-semibold text-gray-900">Notes de consultation</h2>
                <p class="text-sm text-gray-600 mt-1">Remplissez les informations de la consultation</p>
            </div>

            <!-- Main consultation fields -->
            <div class="space-y-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1.5">
                        Symptômes du patient
                    </label>
                    <textarea
                            name="symptoms"
                            rows="3"
                            class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent resize-none"
                            placeholder="Décrivez les symptômes du patient..."
                    >${consultation.symptomAnalyse}</textarea>
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1.5">
                        Examen clinique
                    </label>
                    <textarea
                            name="clinicalExam"
                            rows="3"
                            class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent resize-none"
                            placeholder="Notes de l'examen clinique..."
                    >${consultation.clinicalExamResult}</textarea>
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1.5">
                        Observations
                    </label>
                    <textarea
                            name="observations"
                            rows="3"
                            class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent resize-none"
                            placeholder="Observations supplémentaires..."
                    >${consultation.observations}</textarea>
                </div>
            </div>

            <!-- Action Buttons -->
            <div class="flex flex-col-reverse sm:flex-row justify-end gap-3 pt-6 border-t border-gray-200">
                <a
                        href="${pageContext.request.contextPath}/consultation/request-specialist?${consultation.id}"
                        class="px-5 py-2.5 bg-gray-50 text-gray-700 rounded border border-gray-200 hover:bg-gray-100 transition-colors text-sm font-medium text-center"
                >
                    Demander avis spécialiste
                </a>
                <button
                        type="button"
                        onclick="document.getElementById('closeModal').classList.remove('hidden')"
                        class="px-5 py-2.5 bg-black text-white rounded hover:bg-gray-800 transition-colors shadow-sm text-sm font-medium"
                >
                    Clôturer la consultation
                </button>
            </div>

            <!-- Modal -->
            <div id="closeModal" class="hidden fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
                <div class="bg-white rounded shadow-sm w-full max-w-lg p-6 relative">

                    <!-- Modal Header -->
                    <div class="mb-6">
                        <h3 class="text-xl font-semibold text-gray-900">Finaliser la consultation</h3>
                        <p class="text-sm text-gray-600 mt-1">Complétez les informations pour clôturer</p>
                    </div>

                    <!-- Modal Fields -->
                    <div class="space-y-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1.5">
                                Diagnostic
                            </label>
                            <input
                                    name="diagnosis"
                                    required
                                    placeholder="Ex: Grippe, infection ORL..."
                                    class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent"
                            />
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1.5">
                                Traitement
                            </label>
                            <textarea
                                    name="treatment"
                                    required
                                    rows="3"
                                    placeholder="Ex: Repos, hydratation, etc..."
                                    class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent resize-none"
                            ></textarea>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1.5">
                                Médicaments prescrits
                            </label>
                            <textarea
                                    name="medications"
                                    rows="3"
                                    placeholder="Ex: Paracétamol 1g, 3x/jour; Sirop antitussif..."
                                    class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent resize-none"
                            ></textarea>
                        </div>
                    </div>

                    <!-- Modal Actions -->
                    <div class="flex flex-col-reverse sm:flex-row justify-end gap-3 mt-6 pt-6 border-t border-gray-200">
                        <button
                                type="button"
                                onclick="document.getElementById('closeModal').classList.add('hidden')"
                                class="px-4 py-2 bg-gray-50 text-gray-700 rounded border border-gray-200 hover:bg-gray-100 transition-colors text-sm font-medium"
                        >
                            Annuler
                        </button>
                        <button
                                type="submit"
                                name="action"
                                value="close"
                                class="px-4 py-2 bg-black text-white rounded hover:bg-gray-800 transition-colors shadow-sm text-sm font-medium"
                        >
                            Confirmer et clôturer
                        </button>
                    </div>

                    <!-- Close Icon -->
                    <button
                            type="button"
                            onclick="document.getElementById('closeModal').classList.add('hidden')"
                            class="absolute top-4 right-4 text-gray-400 hover:text-gray-600 transition-colors"
                    >
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                        </svg>
                    </button>
                </div>
            </div>
        </form>
    </div>
</main>

<jsp:include page="/template/footer.jsp" />
</body>
</html>