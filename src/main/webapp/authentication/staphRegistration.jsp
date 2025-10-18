<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Staff Registration</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white min-h-screen py-12 px-4">
<div class="max-w-2xl mx-auto">

<%--    <c:if test="${sessionScope.user.role != 'admin'}">--%>
<%--        <jsp:forward page="/unauthorized.jsp"/>--%>
<%--    </c:if>--%>

    <jsp:include page="/template/header.jsp" />
    <!-- Header -->
    <div class="text-center mb-8">
        <div class="inline-block bg-black text-white w-12 h-12 rounded flex items-center justify-center mb-4">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"/>
            </svg>
        </div>
        <h1 class="text-2xl font-semibold text-gray-900">Inscription du personnel</h1>
        <p class="text-sm text-gray-600 mt-1">Créez un compte pour accéder au système</p>
    </div>

    <!-- Registration Form Card -->
    <div class="bg-white border border-gray-200 rounded shadow-sm p-6">
        <form action="${pageContext.request.contextPath}/staphRegister" method="post" class="space-y-6">

            <!-- Personal Information Section -->
            <div>
                <h2 class="text-sm font-semibold text-gray-900 uppercase tracking-wide mb-4 pb-2 border-b border-gray-200">
                    Informations personnelles
                </h2>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label for="firstname" class="block text-sm font-medium text-gray-700 mb-1.5">
                            Prénom
                        </label>
                        <input
                                type="text"
                                id="firstname"
                                name="firstname"
                                placeholder="Jean"
                                class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent transition-shadow"
                                required
                        >
                    </div>
                    <div>
                        <label for="lastname" class="block text-sm font-medium text-gray-700 mb-1.5">
                            Nom
                        </label>
                        <input
                                type="text"
                                id="lastname"
                                name="lastname"
                                placeholder="Dupont"
                                class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent transition-shadow"
                                required
                        >
                    </div>
                </div>
            </div>

            <!-- Contact Information Section -->
            <div>
                <h2 class="text-sm font-semibold text-gray-900 uppercase tracking-wide mb-4 pb-2 border-b border-gray-200">
                    Coordonnées
                </h2>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label for="email" class="block text-sm font-medium text-gray-700 mb-1.5">
                            Adresse email
                        </label>
                        <input
                                type="email"
                                id="email"
                                name="email"
                                placeholder="jean.dupont@hopital.fr"
                                class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent transition-shadow"
                                required
                        >
                    </div>
                    <div>
                        <label for="phone" class="block text-sm font-medium text-gray-700 mb-1.5">
                            Téléphone
                        </label>
                        <input
                                type="tel"
                                id="phone"
                                name="phone"
                                placeholder="06 12 34 56 78"
                                class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent transition-shadow"
                                required
                        >
                    </div>
                </div>
            </div>

            <!-- Role Section -->
            <div>
                <h2 class="text-sm font-semibold text-gray-900 uppercase tracking-wide mb-4 pb-2 border-b border-gray-200">
                    Rôle professionnel
                </h2>
                <div>
                    <label for="role" class="block text-sm font-medium text-gray-700 mb-1.5">
                        Fonction
                    </label>
                    <select
                            id="role"
                            name="role"
                            class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent transition-shadow"
                            required
                    >
                        <option value="">Sélectionnez un rôle</option>
                        <option value="general_doctor">Médecin généraliste</option>
                        <option value="special_doctor">Médecin spécialiste</option>
                        <option value="nurse">Infirmière</option>
                    </select>
                </div>
            </div>

            <!-- Security Section -->
            <div>
                <h2 class="text-sm font-semibold text-gray-900 uppercase tracking-wide mb-4 pb-2 border-b border-gray-200">
                    Sécurité
                </h2>
                <div>
                    <label for="password" class="block text-sm font-medium text-gray-700 mb-1.5">
                        Mot de passe
                    </label>
                    <input
                            type="password"
                            id="password"
                            name="password"
                            placeholder="••••••••"
                            class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent transition-shadow"
                            required
                    >
                    <p class="mt-1.5 text-xs text-gray-500">
                        Le mot de passe doit contenir au moins 8 caractères
                    </p>
                </div>
            </div>

            <!-- Error Message -->
            <c:if test="${not empty errors}">
                <div class="bg-red-50 border border-red-200 rounded p-3">
                    <div class="flex items-start">
                        <svg class="w-5 h-5 text-red-600 mt-0.5 mr-2 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                        </svg>
                        <p class="text-sm text-red-800">${errors}</p>
                    </div>
                </div>
            </c:if>

            <!-- Form Actions -->
            <div class="flex flex-col-reverse sm:flex-row justify-end gap-3 pt-4 border-t border-gray-200">
                <a
                        href="${pageContext.request.contextPath}/login"
                        class="px-6 py-2.5 bg-gray-50 text-gray-700 rounded border border-gray-200 hover:bg-gray-100 transition-colors text-sm font-medium text-center"
                >
                    Annuler
                </a>
                <button
                        type="submit"
                        class="px-6 py-2.5 bg-black text-white rounded hover:bg-gray-800 transition-colors shadow-sm text-sm font-medium"
                >
                    Créer le compte
                </button>
            </div>
        </form>
    </div>

    <!-- Login Link -->
    <div class="mt-6 text-center">
        <p class="text-sm text-gray-600">
            Vous avez déjà un compte ?
            <a href="${pageContext.request.contextPath}/login" class="text-gray-900 font-medium hover:underline">
                Se connecter
            </a>
        </p>
    </div>
</div>

<jsp:include page="/template/footer.jsp" />
</body>
</html>