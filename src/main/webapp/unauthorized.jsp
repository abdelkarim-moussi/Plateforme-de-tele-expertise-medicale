<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Accès non autorisé</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white min-h-screen flex items-center justify-center p-4">
<div class="max-w-md w-full text-center">
    <!-- Icon -->
    <div class="mb-6 flex justify-center">
        <div class="bg-gray-100 rounded-full p-6 border border-gray-200">
            <svg class="w-16 h-16 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"/>
            </svg>
        </div>
    </div>

    <!-- Error Code -->
    <div class="mb-4">
        <h1 class="text-6xl font-bold text-gray-900">403</h1>
    </div>

    <!-- Message Card -->
    <div class="bg-white border border-gray-200 rounded shadow-sm p-6 mb-6">
        <h2 class="text-xl font-semibold text-gray-900 mb-2">Accès non autorisé</h2>
        <p class="text-sm text-gray-600 leading-relaxed">
            Vous n'êtes pas autorisé à accéder à cette page.
            Veuillez contacter un administrateur si vous pensez qu'il s'agit d'une erreur.
        </p>
    </div>

    <!-- Actions -->
    <div class="flex flex-col sm:flex-row gap-3 justify-center">
        <button onclick="history.back()"
           class="px-6 py-2.5 bg-black text-white rounded hover:bg-gray-800 transition-colors shadow-sm text-sm font-medium">
            Retour à la page précédente
        </button>
        <a href="${pageContext.request.contextPath}"
           class="px-6 py-2.5 bg-gray-50 text-gray-700 rounded border border-gray-200 hover:bg-gray-100 transition-colors text-sm font-medium">
            Se reconnecter
        </a>
    </div>

    <!-- Help Text -->
    <p class="mt-8 text-xs text-gray-500">
        Code d'erreur: 403 - Accès refusé
    </p>
</div>
</body>
</html>