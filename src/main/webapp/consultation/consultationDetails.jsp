<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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

<body class="bg-gray-50 min-h-screen font-sans text-gray-800">

<!-- Header -->

<header class="bg-white shadow p-4 flex justify-between items-center">
    <div>
        <h1 class="text-2xl font-semibold">Consultation Médicale</h1>
        <p class="text-sm text-gray-500">
            Patient: <span class="font-medium">${patient.firstName} ${patient.lastName}</span> |
            Âge: ${patient.dateOfBirth} ans |
            ID Consultation: ${consultation.id}
        </p>
    </div>
    <span class="px-3 py-1 rounded-full text-xs font-medium bg-blue-100 text-blue-800">
            Statut: ${consultation.status}
        </span>
</header>

<!-- Main Content -->
<main class="max-w-5xl mx-auto mt-6 bg-white p-6 rounded-2xl shadow-sm">
    <form action="${pageContext.request.contextPath}/consultation" method="post"
          class="max-w-3xl mx-auto bg-white shadow-lg rounded-2xl p-8 space-y-6">

        <!-- Header -->
        <h2 class="text-2xl font-semibold text-gray-800 border-b pb-3">
            Consultation médicale
        </h2>

        <!-- Main consultation fields -->
        <div class="space-y-4">
            <input type="hidden" name="patientId" value="${patient.id}">
            <input type="hidden" name="consultationId" value="${consultation.id}">
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">
                    Symptômes du patient
                </label>
                <textarea name="symptoms" rows="3"
                          class="w-full border border-gray-300 focus:border-blue-500 focus:ring-2 focus:ring-blue-200
                             rounded-lg p-3 text-gray-800 resize-none"
                          placeholder="Décrivez les symptômes du patient...">${consultation.symptomAnalyse}</textarea>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">
                    Examen clinique
                </label>
                <textarea name="clinicalExam" rows="3"
                          class="w-full border border-gray-300 focus:border-blue-500 focus:ring-2 focus:ring-blue-200
                             rounded-lg p-3 text-gray-800 resize-none"
                          placeholder="Notes de l'examen clinique...">${consultation.clinicalExamResult}</textarea>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">
                    Observations
                </label>
                <textarea name="observations" rows="3"
                          class="w-full border border-gray-300 focus:border-blue-500 focus:ring-2 focus:ring-blue-200
                             rounded-lg p-3 text-gray-800 resize-none"
                          placeholder="Observations supplémentaires...">${consultation.observations}</textarea>
            </div>
        </div>

        <!-- Button: Clôturer -->
        <div class="flex justify-end gap-3">
            <!-- Request Specialist -->
            <a href="/consultations/${consultation.id}/request-specialist"
               class="px-4 py-2 bg-yellow-500 hover:bg-yellow-600 text-white rounded-xl transition">
                Demander avis spécialiste
            </a>

            <button type="button"
                    onclick="document.getElementById('closeModal').classList.remove('hidden')"
                    class="bg-green-600 hover:bg-green-700 text-white font-medium px-5 py-2.5 rounded-xl
                       shadow-md transition duration-200">
                Clôturer la consultation
            </button>
        </div>

        <!-- Modal -->
        <div id="closeModal" class="hidden fixed inset-0 bg-black/50 flex items-center justify-center z-50">
            <div class="bg-white rounded-2xl w-full max-w-lg p-8 shadow-2xl relative animate-fade-in">

                <h3 class="text-xl font-semibold text-gray-800 mb-4">Finaliser la consultation</h3>

                <div class="space-y-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Diagnostic</label>
                        <input name="diagnosis" required placeholder="Ex: Grippe, infection ORL..."
                               class="w-full border border-gray-300 focus:border-blue-500 focus:ring-2 focus:ring-blue-200
                                  rounded-lg p-3 text-gray-800" />
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Traitement</label>
                        <textarea name="treatment" required placeholder="Ex: Repos, hydratation, etc..."
                                  class="w-full border border-gray-300 focus:border-blue-500 focus:ring-2 focus:ring-blue-200
                                     rounded-lg p-3 text-gray-800 resize-none"></textarea>
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Médicaments prescrits</label>
                        <textarea name="medications" placeholder="Ex: Paracétamol 1g, 3x/jour; Sirop antitussif..."
                                  class="w-full border border-gray-300 focus:border-blue-500 focus:ring-2 focus:ring-blue-200
                                     rounded-lg p-3 text-gray-800 resize-none"></textarea>
                    </div>
                </div>

                <!-- Buttons -->
                <div class="flex justify-end gap-3 mt-6">
                    <button type="button"
                            onclick="document.getElementById('closeModal').classList.add('hidden')"
                            class="px-4 py-2 bg-gray-300 hover:bg-gray-400 text-gray-700 rounded-lg transition">
                        Annuler
                    </button>

                    <button type="submit" name="action" value="close"
                            class="px-4 py-2 bg-green-600 hover:bg-green-700 text-white rounded-lg shadow-sm transition">
                        Confirmer et clôturer
                    </button>
                </div>

                <!-- Optional close icon -->
                <button type="button"
                        onclick="document.getElementById('closeModal').classList.add('hidden')"
                        class="absolute top-3 right-3 text-gray-500 hover:text-gray-700 text-xl font-bold">
                    ×
                </button>
            </div>
        </div>
    </form>

</main>

</body>
</html>
