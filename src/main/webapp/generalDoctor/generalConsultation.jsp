<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Consultation - Médecin Généraliste</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

</head>
<body>
<div class="container">
    <h1>Consultation - Médecin Généraliste</h1>

    <!-- Dossier patient -->
    <div class="patient-info">
        <h2>Dossier du patient</h2>

        <!-- Ces données seraient normalement chargées via le patientId -->
        <p><strong>Nom :</strong> Dupont</p>
        <p><strong>Prénom :</strong> Marie</p>
        <p><strong>Date de naissance :</strong> 1985-03-12</p>
        <p><strong>Numéro Sécurité Sociale :</strong> 1234567890123</p>
        <p><strong>Antécédents :</strong> Asthme</p>
        <p><strong>Allergies :</strong> Pollen</p>
        <p><strong>Traitements en cours :</strong> Ventoline</p>
    </div>

    <!-- Formulaire de consultation -->
    <form action="CreerConsultationServlet" method="post">
        <input type="hidden" name="patientId" value="${param.patientId}">

        <h2>Examen Clinique</h2>
        <textarea name="examenClinique" rows="3" required></textarea>

        <h2>Analyse des Symptômes</h2>
        <textarea name="symptomes" rows="3" required></textarea>

        <h2>Observations du Médecin</h2>
        <textarea name="observations" rows="3"></textarea>

        <div class="buttons">
            <button type="submit" name="action" value="terminer" class="btn">Clôturer la Consultation</button>
            <button type="submit" name="action" value="teleexpertise" class="btn btn-tele">Demander Avis Spécialiste</button>
        </div>
    </form>
</div>
</body>
</html>
