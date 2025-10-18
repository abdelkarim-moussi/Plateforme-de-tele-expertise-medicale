<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header class="shadow-md">
    <div class="max-w-7xl mx-auto flex justify-between items-center px-6 py-4">

        <div class="flex items-center space-x-3">
            <h1 class="text-xl font-semibold">Système de Télé-Expertise</h1>
        </div>

        <div class="flex items-center space-x-6 text-sm">
            <c:if test="${not empty sessionScope.user}">
                <span class="font-medium">
                    Bonjour, <span class="text-gray-200">${sessionScope.user.firstName}</span>
                    <span class="text-xs text-gray-300">(${sessionScope.user.role})</span>
                </span>
            </c:if>

            <a href="${pageContext.request.contextPath}/logout"
               class="bg-white px-3 py-1 rounded-lg hover:bg-gray-100 transition">
                Déconnexion
            </a>

        </div>

    </div>
</header>
