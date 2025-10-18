<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Enregistrement du Patient</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white min-h-screen py-12 px-4">
<div class="max-w-5xl mx-auto">
    <!-- Header -->
    <header class="bg-black text-white shadow-sm mb-8">
        <div class="px-6 py-4">
            <h1 class="text-2xl font-semibold">Enregistrement du Patient</h1>
            <p class="text-sm text-gray-300 mt-1">Remplissez toutes les informations nécessaires</p>
        </div>
    </header>

    <!-- Form Card -->
    <div class="bg-white border border-gray-200 rounded shadow-sm p-8">
        <form action="${pageContext.request.contextPath}/registerPatient" method="post" class="space-y-8">

            <!-- Données Administratives -->
            <section>
                <h2 class="text-sm font-semibold text-gray-900 uppercase tracking-wide mb-4 pb-2 border-b border-gray-200">
                    Données Administratives
                </h2>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1.5">Prénom</label>
                        <input
                                type="text"
                                name="firstname"
                                class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent"
                                placeholder="Jean"
                                required
                        >
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1.5">Nom</label>
                        <input
                                type="text"
                                name="lastname"
                                class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent"
                                placeholder="Dupont"
                                required
                        >
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1.5">Email</label>
                        <input
                                type="email"
                                name="email"
                                class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent"
                                placeholder="jean.dupont@email.com"
                        >
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1.5">Téléphone</label>
                        <input
                                type="tel"
                                name="phone"
                                class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent"
                                placeholder="06 12 34 56 78"
                                required
                        >
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1.5">Date de naissance</label>
                        <input
                                type="date"
                                name="dateOfBirth"
                                class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent"
                                required
                        >
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1.5">Numéro de sécurité sociale</label>
                        <input
                                type="text"
                                name="securityNumber"
                                class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent"
                                placeholder="1 23 45 67 890 123 45"
                                required
                        >
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1.5">Adresse</label>
                        <input
                                type="text"
                                name="address"
                                class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent"
                                placeholder="123 Rue de la République"
                        >
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1.5">Numéro CNI</label>
                        <input
                                type="text"
                                name="CNI"
                                class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent"
                                placeholder="AB123456"
                        >
                    </div>
                </div>
            </section>

            <!-- Données Médicales -->
            <section>
                <h2 class="text-sm font-semibold text-gray-900 uppercase tracking-wide mb-4 pb-2 border-b border-gray-200">
                    Données Médicales
                </h2>
                <div class="space-y-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1.5">Antécédents médicaux</label>
                        <textarea
                                name="antecedents"
                                rows="3"
                                class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent resize-none"
                                placeholder="Diabète, hypertension, chirurgies antérieures..."
                        ></textarea>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1.5">Allergies</label>
                        <textarea
                                name="allergies"
                                rows="2"
                                class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent resize-none"
                                placeholder="Pénicilline, arachides, pollen..."
                        ></textarea>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1.5">Traitements en cours</label>
                        <textarea
                                name="ongoingTreatment"
                                rows="2"
                                class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent resize-none"
                                placeholder="Médicaments actuels et posologies..."
                        ></textarea>
                    </div>
                </div>
            </section>

            <!-- Signes Vitaux -->
            <section>
                <h2 class="text-sm font-semibold text-gray-900 uppercase tracking-wide mb-4 pb-2 border-b border-gray-200">
                    Signes Vitaux
                </h2>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1.5">Taille (cm)</label>
                        <input
                                type="number"
                                name="height"
                                step="0.1"
                                class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent"
                                placeholder="175"
                        >
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1.5">Poids (kg)</label>
                        <input
                                type="number"
                                name="weight"
                                step="0.1"
                                class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent"
                                placeholder="70"
                        >
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1.5">Fréquence respiratoire (resp/min)</label>
                        <input
                                type="number"
                                name="respiratoryRate"
                                class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent"
                                placeholder="16"
                        >
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1.5">Température corporelle (°C)</label>
                        <input
                                type="number"
                                name="bodyTemperature"
                                step="0.1"
                                class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent"
                                placeholder="37.0"
                        >
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1.5">Fréquence cardiaque (bpm)</label>
                        <input
                                type="number"
                                name="heartRate"
                                class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent"
                                placeholder="72"
                        >
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1.5">Tension artérielle (mmHg)</label>
                        <input
                                type="text"
                                name="bloodPressure"
                                class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent"
                                placeholder="120/80"
                        >
                    </div>
                </div>
            </section>

            <!-- Form Actions -->
            <div class="flex flex-col-reverse sm:flex-row justify-end gap-3 pt-6 border-t border-gray-200">
                <button
                        type="reset"
                        class="px-6 py-2.5 bg-gray-50 text-gray-700 rounded border border-gray-200 hover:bg-gray-100 transition-colors text-sm font-medium"
                >
                    Annuler
                </button>
                <button
                        type="submit"
                        class="px-6 py-2.5 bg-black text-white rounded hover:bg-gray-800 transition-colors shadow-sm text-sm font-medium"
                >
                    Enregistrer le patient
                </button>
            </div>
        </form>
    </div>
</div>
</body>
</html>