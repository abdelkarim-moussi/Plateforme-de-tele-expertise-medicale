<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white min-h-screen flex items-center justify-center p-4">

<c:if test="${not empty sessionScope.user}">
    <c:choose>
        <c:when test="${sessionScope.user.role == 'general_doctor'}">
            <jsp:forward page="/generalDoctor/dashboard.jsp"/>
        </c:when>

        <c:when test="${sessionScope.user.role == 'nurse'}">
            <jsp:forward page="/nurse/dashboard.jsp"/>
        </c:when>

        <c:when test="${sessionScope.user.role == 'special_doctor'}">
            <jsp:forward page="/specialDoctor/dashboard.jsp"/>
        </c:when>

        <c:otherwise>
            <jsp:forward page="/unauthorized.jsp"/>
        </c:otherwise>
    </c:choose>
</c:if>

<div class="w-full max-w-md">
    <!-- Header -->
    <div class="text-center mb-8">
        <div class="inline-block bg-black text-white w-12 h-12 rounded flex items-center justify-center mb-4">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
            </svg>
        </div>
        <h1 class="text-2xl font-semibold text-gray-900">Connexion</h1>
        <p class="text-sm text-gray-600 mt-1">Accédez à votre espace de travail</p>
    </div>

    <!-- Login Form Card -->
    <div class="bg-white border border-gray-200 rounded shadow-sm p-6">
        <form action="${pageContext.request.contextPath}/login" method="post" class="space-y-4">
            <!-- Email Field -->
            <div>
                <label for="email" class="block text-sm font-medium text-gray-700 mb-1.5">
                    Adresse email
                </label>
                <input
                        type="text"
                        id="email"
                        name="email"
                        placeholder="exemple@email.com"
                        class="w-full px-3 py-2 border border-gray-300 rounded text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-900 focus:border-transparent transition-shadow"
                        required
                >
            </div>

            <!-- Password Field -->
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

            <!-- Submit Button -->
            <button
                    type="submit"
                    class="w-full bg-black text-white py-2.5 rounded font-medium hover:bg-gray-800 transition-colors shadow-sm"
            >
                Se connecter
            </button>
        </form>

        <!-- Footer Links -->
        <div class="mt-6 text-center">
            <a href="#" class="text-sm text-gray-600 hover:text-gray-900 transition-colors">
                Mot de passe oublié ?
            </a>
        </div>
    </div>

    <!-- Registration Link -->
    <div class="mt-6 text-center">
        <p class="text-sm text-gray-600">
            Nouveau membre du personnel ?
            <a href="${pageContext.request.contextPath}/staphRegister" class="text-gray-900 font-medium hover:underline">
                Créer un compte
            </a>
        </p>
    </div>
</div>
</body>
</html>