<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Demande d'Expertise</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white min-h-screen">
<!-- Header -->
<header class="bg-black text-white shadow-sm">
    <div class="max-w-7xl mx-auto px-6 py-4">
        <h1 class="text-2xl font-semibold">Demande d'Avis Spécialiste</h1>
        <p class="text-sm text-gray-300 mt-1">
            Patient: ${patient.firstName} ${patient.lastName} | Consultation ID: ${consultation.id}
        </p>
    </div>
</header>

<!-- Main Content -->
<main class="max-w-7xl mx-auto px-6 py-8">

    <!-- Step 1: Select Specialty -->
    <div class="bg-white border border-gray-200 rounded shadow-sm p-6 mb-6">
        <div class="mb-6">
            <h2 class="text-lg font-semibold text-gray-900 mb-2">Étape 1: Sélectionner la spécialité</h2>
            <p class="text-sm text-gray-600">Choisissez la spécialité médicale requise selon le cas du patient</p>
        </div>

        <div class="max-w-md">
            <label for="specialty" class="block text-sm font-medium text-gray-700 mb-2">
                Spécialité médicale
            </label>
            <select
                    id="specialty"
                    name="specialty"
                    onchange="loadSpecialists()"
                    class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent"
            >
                <option value="">-- Sélectionnez une spécialité --</option>
                <option value="Cardiologue">Cardiologue</option>
                <option value="Pneumologue">Pneumologue</option>
                <option value="Dermatologue">Dermatologue</option>
                <option value="Neurologue">Neurologue</option>
                <option value="Endocrinologue">Endocrinologue</option>
                <option value="Gastro-entérologue">Gastro-entérologue</option>
                <option value="Orthopédiste">Orthopédiste</option>
                <option value="ORL">ORL (Oto-rhino-laryngologiste)</option>
                <option value="Ophtalmologue">Ophtalmologue</option>
                <option value="Psychiatre">Psychiatre</option>
            </select>
        </div>
    </div>

    <!-- Step 2: Specialists List -->
    <div id="specialistsList" class="hidden">
        <div class="bg-white border border-gray-200 rounded shadow-sm p-6 mb-6">
            <div class="mb-6">
                <h2 class="text-lg font-semibold text-gray-900 mb-2">Étape 2: Choisir un spécialiste</h2>
                <p class="text-sm text-gray-600">Liste des spécialistes disponibles - triés par tarif</p>
            </div>

            <!-- Loading State -->
            <div id="loadingSpinner" class="text-center py-8">
                <div class="inline-block w-8 h-8 border-4 border-gray-200 border-t-black rounded-full animate-spin"></div>
                <p class="text-sm text-gray-600 mt-2">Chargement des spécialistes...</p>
            </div>

            <!-- Specialists Grid -->
            <div id="specialistsGrid" class="hidden grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                <!-- Specialists will be dynamically loaded here -->
            </div>

            <!-- Empty State -->
            <div id="noSpecialists" class="hidden text-center py-8 text-gray-400">
                <svg class="w-12 h-12 mx-auto mb-3 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.172 16.172a4 4 0 015.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                </svg>
                <p class="text-sm">Aucun spécialiste disponible pour cette spécialité</p>
            </div>
        </div>
    </div>

    <!-- Step 3: Time Slots (Hidden initially) -->
    <div id="timeSlotsSection" class="hidden">
        <div class="bg-white border border-gray-200 rounded shadow-sm p-6 mb-6">
            <div class="mb-6">
                <h2 class="text-lg font-semibold text-gray-900 mb-2">Étape 3: Vérifier la disponibilité</h2>
                <p class="text-sm text-gray-600">Spécialiste sélectionné: <span id="selectedSpecialistName" class="font-semibold text-gray-900"></span></p>
            </div>

            <!-- Loading State -->
            <div id="slotsLoadingSpinner" class="text-center py-8">
                <div class="inline-block w-8 h-8 border-4 border-gray-200 border-t-black rounded-full animate-spin"></div>
                <p class="text-sm text-gray-600 mt-2">Chargement des créneaux...</p>
            </div>

            <!-- Time Slots Grid -->
            <div id="timeSlotsGrid" class="hidden grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-3">
                <!-- Time slots will be dynamically loaded here -->
            </div>

            <!-- Empty State -->
            <div id="noSlots" class="hidden text-center py-8 text-gray-400">
                <p class="text-sm">Aucun créneau disponible</p>
            </div>
        </div>
    </div>

    <!-- Step 4: Request Form (Hidden initially) -->
    <div id="requestFormSection" class="hidden">
        <div class="bg-white border border-gray-200 rounded shadow-sm p-6">
            <div class="mb-6">
                <h2 class="text-lg font-semibold text-gray-900 mb-2">Étape 4: Créer la demande d'expertise</h2>
                <p class="text-sm text-gray-600">Remplissez les détails de votre demande</p>
            </div>

            <form action="${pageContext.request.contextPath}/expertise/create" method="post" class="space-y-6">
                <input type="hidden" name="patientId" value="${patient.id}">
                <input type="hidden" name="consultationId" value="${consultation.id}">
                <input type="hidden" id="selectedSpecialistId" name="specialistId">
                <input type="hidden" id="selectedSlotId" name="slotId">

                <!-- Selected Info Display -->
                <div class="bg-gray-50 rounded border border-gray-200 p-4">
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-4 text-sm">
                        <div>
                            <span class="text-gray-600">Spécialiste:</span>
                            <div class="font-semibold text-gray-900" id="formSpecialistName"></div>
                        </div>
                        <div>
                            <span class="text-gray-600">Créneau:</span>
                            <div class="font-semibold text-gray-900" id="formSlotInfo"></div>
                        </div>
                        <div>
                            <span class="text-gray-600">Tarif:</span>
                            <div class="font-semibold text-gray-900" id="formRate"></div>
                        </div>
                    </div>
                </div>

                <!-- Type of Expertise -->
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">
                        Type de télé-expertise
                    </label>
                    <div class="flex gap-4">
                        <label class="flex items-center">
                            <input type="radio" name="expertiseType" value="SYNCHRONE" class="mr-2" checked>
                            <span class="text-sm text-gray-900">Synchrone (temps réel)</span>
                        </label>
                        <label class="flex items-center">
                            <input type="radio" name="expertiseType" value="ASYNCHRONE" class="mr-2">
                            <span class="text-sm text-gray-900">Asynchrone (différé)</span>
                        </label>
                    </div>
                </div>

                <!-- Priority -->
                <div>
                    <label for="priority" class="block text-sm font-medium text-gray-700 mb-2">
                        Niveau de priorité
                    </label>
                    <select
                            id="priority"
                            name="priority"
                            class="w-full md:w-64 px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent"
                            required
                    >
                        <option value="NORMALE" selected>Normale</option>
                        <option value="URGENTE">Urgente</option>
                        <option value="NON_URGENTE">Non urgente</option>
                    </select>
                </div>

                <!-- Question/Message -->
                <div>
                    <label for="message" class="block text-sm font-medium text-gray-700 mb-2">
                        Question posée au spécialiste *
                    </label>
                    <textarea
                            id="message"
                            name="message"
                            rows="5"
                            class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent resize-none"
                            placeholder="Décrivez la situation du patient et la question médicale que vous souhaitez poser au spécialiste..."
                            required
                    ></textarea>
                </div>

                <!-- Form Actions -->
                <div class="flex flex-col-reverse sm:flex-row justify-end gap-3 pt-6 border-t border-gray-200">
                    <a
                            href="${pageContext.request.contextPath}/consultation?consultationId=${consultation.id}"
                            class="px-6 py-2.5 bg-gray-50 text-gray-700 rounded border border-gray-200 hover:bg-gray-100 transition-colors text-sm font-medium text-center"
                    >
                        Annuler
                    </a>
                    <button
                            type="submit"
                            class="px-6 py-2.5 bg-black text-white rounded hover:bg-gray-800 transition-colors shadow-sm text-sm font-medium"
                    >
                        Envoyer la demande
                    </button>
                </div>
            </form>
        </div>
    </div>

</main>

<script>
    let selectedSpecialist = null;
    let selectedSlot = null;

    // Load specialists based on selected specialty
    function loadSpecialists() {
        const specialty = document.getElementById('specialty').value;

        if (!specialty) {
            document.getElementById('specialistsList').classList.add('hidden');
            document.getElementById('timeSlotsSection').classList.add('hidden');
            document.getElementById('requestFormSection').classList.add('hidden');
            return;
        }

        // Show specialists section
        document.getElementById('specialistsList').classList.remove('hidden');
        document.getElementById('loadingSpinner').classList.remove('hidden');
        document.getElementById('specialistsGrid').classList.add('hidden');
        document.getElementById('noSpecialists').classList.add('hidden');

        // Hide subsequent sections
        document.getElementById('timeSlotsSection').classList.add('hidden');
        document.getElementById('requestFormSection').classList.add('hidden');

        // Fetch specialists from server
        fetch('${pageContext.request.contextPath}/api/specialists?specialty=' + encodeURIComponent(specialty))
            .then(response => response.json())
            .then(specialists => {
                document.getElementById('loadingSpinner').classList.add('hidden');

                if (specialists.length === 0) {
                    document.getElementById('noSpecialists').classList.remove('hidden');
                    return;
                }

                // Display specialists
                const grid = document.getElementById('specialistsGrid');
                grid.innerHTML = '';
                grid.classList.remove('hidden');

                specialists.forEach(specialist => {
                    const card = createSpecialistCard(specialist);
                    grid.appendChild(card);
                });
            })
            .catch(error => {
                console.error('Error loading specialists:', error);
                document.getElementById('loadingSpinner').classList.add('hidden');
                document.getElementById('noSpecialists').classList.remove('hidden');
            });
    }

    // Create specialist card element
    function createSpecialistCard(specialist) {
        const div = document.createElement('div');
        div.className = 'bg-gray-50 rounded border border-gray-200 p-4 hover:border-gray-400 transition-colors cursor-pointer';
        div.onclick = () => selectSpecialist(specialist);

        div.innerHTML = `
                <div class="mb-3">
                    <div class="font-semibold text-gray-900 mb-1">Dr. ${specialist.firstname} ${specialist.lastname}</div>
                    <div class="text-xs text-gray-600">${specialist.specialty}</div>
                </div>
                <div class="flex justify-between items-center pt-3 border-t border-gray-200">
                    <div class="text-sm">
                        <span class="text-gray-600">Tarif:</span>
                        <span class="font-semibold text-gray-900">${specialist.consultationRate}€</span>
                    </div>
                    <span class="px-2 py-1 rounded text-xs font-medium ${
                        specialist.availabilityStatus === 'DISPONIBLE' ? 'bg-gray-100 text-gray-900' : 'bg-gray-800 text-white'
                    }">
                        ${specialist.availabilityStatus}
                    </span>
                </div>
            `;

        return div;
    }

    // Select specialist and load time slots
    function selectSpecialist(specialist) {
        selectedSpecialist = specialist;

        // Show time slots section
        document.getElementById('timeSlotsSection').classList.remove('hidden');
        document.getElementById('selectedSpecialistName').textContent = `Dr. ${specialist.firstname} ${specialist.lastname}`;
        document.getElementById('slotsLoadingSpinner').classList.remove('hidden');
        document.getElementById('timeSlotsGrid').classList.add('hidden');
        document.getElementById('noSlots').classList.add('hidden');

        // Hide form section
        document.getElementById('requestFormSection').classList.add('hidden');

        // Scroll to time slots section
        document.getElementById('timeSlotsSection').scrollIntoView({ behavior: 'smooth', block: 'start' });

        // Fetch time slots
        fetch('${pageContext.request.contextPath}/api/specialists/' + specialist.id + '/slots')
            .then(response => response.json())
            .then(slots => {
                document.getElementById('slotsLoadingSpinner').classList.add('hidden');

                if (slots.length === 0) {
                    document.getElementById('noSlots').classList.remove('hidden');
                    return;
                }

                // Display time slots
                const grid = document.getElementById('timeSlotsGrid');
                grid.innerHTML = '';
                grid.classList.remove('hidden');

                slots.forEach(slot => {
                    const card = createTimeSlotCard(slot);
                    grid.appendChild(card);
                });
            })
            .catch(error => {
                console.error('Error loading slots:', error);
                document.getElementById('slotsLoadingSpinner').classList.add('hidden');
                document.getElementById('noSlots').classList.remove('hidden');
            });
    }

    // Create time slot card element
    function createTimeSlotCard(slot) {
        const div = document.createElement('div');
        const isAvailable = slot.status === 'DISPONIBLE';

        div.className = `rounded border p-3 text-center ${
                isAvailable
                    ? 'bg-white border-gray-300 hover:border-black cursor-pointer transition-colors'
                    : 'bg-gray-100 border-gray-200 opacity-60 cursor-not-allowed'
            }`;

        if (isAvailable) {
            div.onclick = () => selectTimeSlot(slot);
        }

        div.innerHTML = `
                <div class="text-xs font-medium text-gray-600 mb-1">${slot.date}</div>
                <div class="text-sm font-semibold text-gray-900">${slot.startTime} - ${slot.endTime}</div>
                <div class="mt-2">
                    <span class="px-2 py-1 rounded text-xs font-medium ${
                        slot.status === 'DISPONIBLE' ? 'bg-gray-100 text-gray-900' : 'bg-gray-800 text-white'
                    }">
                        ${slot.status}
                    </span>
                </div>
            `;

        return div;
    }

    // Select time slot and show form
    function selectTimeSlot(slot) {
        selectedSlot = slot;

        // Update hidden form fields
        document.getElementById('selectedSpecialistId').value = selectedSpecialist.id;
        document.getElementById('selectedSlotId').value = slot.id;

        // Update form display info
        document.getElementById('formSpecialistName').textContent = `Dr. ${selectedSpecialist.firstname} ${selectedSpecialist.lastname}`;
        document.getElementById('formSlotInfo').textContent = `${slot.date} ${slot.startTime}-${slot.endTime}`;
        document.getElementById('formRate').textContent = `${selectedSpecialist.consultationRate}€`;

        // Show form section
        document.getElementById('requestFormSection').classList.remove('hidden');

        // Scroll to form
        document.getElementById('requestFormSection').scrollIntoView({ behavior: 'smooth', block: 'start' });
    }
</script>
</body>
</html>