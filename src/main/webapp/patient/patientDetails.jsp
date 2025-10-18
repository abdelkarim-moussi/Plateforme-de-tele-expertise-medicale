<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dossier Medical Patient</title>
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
<body class="bg-gradient-to-br min-h-screen py-8 px-4">
<div class="max-w-7xl mx-auto relative">
    <!-- Page Title -->
    <h1 class="text-4xl font-bold text-white text-center mb-8 drop-shadow-lg bg-gradient-to-r from-purple-700 to-purple-800 py-6 px-8">
        Dossier Medical - <strong>${patient.firstName} ${patient.lastName}</strong>
    </h1>

    <!-- Patient Card -->
    <div class="bg-white rounded-2xl shadow-2xl overflow-hidden mb-8">

        <div class="p-8 space-y-8">
            <!-- Informations Personnelles -->
            <div>
                <h3 class="text-xl font-semibold text-purple-700 mb-4 pb-2 border-b-2 border-purple-200 flex items-center gap-2">
                    <div class="w-1 h-6 bg-gradient-to-b from-purple-600 to-purple-700 rounded"></div>
                    Informations Personnelles
                </h3>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
                    <div class="bg-purple-50 rounded-lg px-5 py-4 border-l-4 border-purple-500 hover:shadow-md transition-shadow">
                        <div class="text-xs font-semibold text-purple-700 uppercase tracking-wide mb-1">Nom</div>
                        <div class="text-base font-medium text-gray-900" id="firstName">${patient.firstName}</div>
                    </div>
                    <div class="bg-purple-50 rounded-lg px-5 py-4 border-l-4 border-purple-500 hover:shadow-md transition-shadow">
                        <div class="text-xs font-semibold text-purple-700 uppercase tracking-wide mb-1">Prénom</div>
                        <div class="text-base font-medium text-gray-900" id="lastName">${patient.lastName}</div>
                    </div>
                    <div class="bg-purple-50 rounded-lg px-5 py-4 border-l-4 border-purple-500 hover:shadow-md transition-shadow">
                        <div class="text-xs font-semibold text-purple-700 uppercase tracking-wide mb-1">Date de naissance</div>
                        <div class="text-base font-medium text-gray-900" id="dateOfBirth">${patient.dateOfBirth}</div>
                    </div>
                    <div class="bg-purple-50 rounded-lg px-5 py-4 border-l-4 border-purple-500 hover:shadow-md transition-shadow">
                        <div class="text-xs font-semibold text-purple-700 uppercase tracking-wide mb-1">Numéro Sécurité Sociale</div>
                        <div class="text-base font-medium text-gray-900" id="socialSecurityNumber">${patient.socialSecurityNumber}</div>
                    </div>
                </div>
            </div>

            <!-- Données Médicales -->
            <div>
                <h3 class="text-xl font-semibold text-purple-700 mb-4 pb-2 border-b-2 border-purple-200 flex items-center gap-2">
                    <div class="w-1 h-6 bg-gradient-to-b from-purple-600 to-purple-700 rounded"></div>
                    Données Médicales
                </h3>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div class="bg-purple-50 rounded-lg px-5 py-4 border-l-4 border-purple-500 hover:shadow-md transition-shadow">
                        <div class="text-xs font-semibold text-purple-700 uppercase tracking-wide mb-1">Antécédents</div>
                        <div class="text-base font-medium text-gray-900" id="antecedents">${patient.medicalData.antecedents}</div>
                    </div>
                    <div class="bg-purple-50 rounded-lg px-5 py-4 border-l-4 border-purple-500 hover:shadow-md transition-shadow">
                        <div class="text-xs font-semibold text-purple-700 uppercase tracking-wide mb-1">Allergies</div>
                        <div class="text-base font-medium text-gray-900" id="allergies">${patient.medicalData.allergies}</div>
                    </div>
                    <div class="bg-purple-50 rounded-lg px-5 py-4 border-l-4 border-purple-500 hover:shadow-md transition-shadow md:col-span-2">
                        <div class="text-xs font-semibold text-purple-700 uppercase tracking-wide mb-1">Traitements en cours</div>
                        <div class="text-base font-medium text-gray-900" id="ongoingTreatment">${patient.medicalData.ongoingTreatment}</div>
                    </div>
                </div>
            </div>

            <!-- Signes Vitaux -->
            <div>
                <h3 class="text-xl font-semibold text-purple-700 mb-4 pb-2 border-b-2 border-purple-200 flex items-center gap-2">
                    <div class="w-1 h-6 bg-gradient-to-b from-purple-600 to-purple-700 rounded"></div>
                    Signes Vitaux
                </h3>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                    <div class="bg-purple-50 rounded-lg px-5 py-4 border-l-4 border-purple-500 hover:shadow-md transition-shadow">
                        <div class="text-xs font-semibold text-purple-700 uppercase tracking-wide mb-1">Taille</div>
                        <div class="text-base font-medium text-gray-900" id="height">${patient.vitalSigns.weight} cm</div>
                    </div>
                    <div class="bg-purple-50 rounded-lg px-5 py-4 border-l-4 border-purple-500 hover:shadow-md transition-shadow">
                        <div class="text-xs font-semibold text-purple-700 uppercase tracking-wide mb-1">Poids</div>
                        <div class="text-base font-medium text-gray-900" id="weight">${patient.vitalSigns.weight} kg</div>
                    </div>
                    <div class="bg-purple-50 rounded-lg px-5 py-4 border-l-4 border-purple-500 hover:shadow-md transition-shadow">
                        <div class="text-xs font-semibold text-purple-700 uppercase tracking-wide mb-1">Fréquence respiratoire</div>
                        <div class="text-base font-medium text-gray-900" id="respiratoryRate">${patient.vitalSigns.respiratoryRate} respirations/min</div>
                    </div>
                    <div class="bg-purple-50 rounded-lg px-5 py-4 border-l-4 border-purple-500 hover:shadow-md transition-shadow">
                        <div class="text-xs font-semibold text-purple-700 uppercase tracking-wide mb-1">Température corporelle</div>
                        <div class="text-base font-medium text-gray-900" id="bodyTemperature">${patient.vitalSigns.bodyTemperature} °C</div>
                    </div>
                    <div class="bg-purple-50 rounded-lg px-5 py-4 border-l-4 border-purple-500 hover:shadow-md transition-shadow">
                        <div class="text-xs font-semibold text-purple-700 uppercase tracking-wide mb-1">Fréquence cardiaque</div>
                        <div class="text-base font-medium text-gray-900" id="heartRate">${patient.vitalSigns.heartRate} battements/min</div>
                    </div>
                    <div class="bg-purple-50 rounded-lg px-5 py-4 border-l-4 border-purple-500 hover:shadow-md transition-shadow">
                        <div class="text-xs font-semibold text-purple-700 uppercase tracking-wide mb-1">Tension artérielle</div>
                        <div class="text-base font-medium text-gray-900" id="bloodPressure">${patient.vitalSigns.bloodPressure} mmHg</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="text-center">
    <form action="${pageContext.request.contextPath}/consultation" method="get">
        <input type="hidden" name="patientId" value="${patient.id}" />
            <button
                    type="submit"
                    class="bg-gradient-to-r from-purple-600 to-purple-700 text-white font-semibold py-4 px-8 rounded-lg hover:from-purple-700 hover:to-purple-800 focus:outline-none focus:ring-4 focus:ring-purple-300 transition-all transform hover:scale-[1.02] shadow-lg">
                Créer Consultation
            </button>
    </form>
    </div>

</div>
</body>
</html>