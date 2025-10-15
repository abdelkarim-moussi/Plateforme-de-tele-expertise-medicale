<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Enregistrement du Patient</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="container">
    <h1>Enregistrement du Patient</h1>

    <form action="${pageContext.request.contextPath}/registerPatient" method="post" class="form-patient">

        <h2>Données Administratives</h2>

        <label>Prénom :</label>
        <input type="text" name="firstname">

        <label>Nom :</label>
        <input type="text" name="lastname">

        <label>Email :</label>
        <input type="text" name="email">

        <label>Téléphone :</label>
        <input type="tel" name="phone">

        <label>Date de naissance :</label>
        <input type="date" name="dateOfBirth">

        <label>Numéro de sécurité sociale :</label>
        <input type="text" name="securityNumber">

        <label>Adresse :</label>
        <input type="text" name="address">

        <label>Numéro CNI :</label>
        <input type="text" name="CNI">

        <h2>Données Médicales</h2>
        <label>Antécédents médicaux :</label>
        <textarea name="antecedents" rows="3"></textarea>

        <label>Allergies :</label>
        <textarea name="allergies" rows="2"></textarea>

        <label>Traitements en cours :</label>
        <textarea name="ongoingTreatment" rows="2"></textarea>

        <h2>Signes Vitaux</h2>
        <div class="grid">
            <div>
                <label>Taille (cm) :</label>
                <input type="number" name="height" step="0.1">
            </div>
            <div>
                <label>Poids (kg) :</label>
                <input type="number" name="weight" step="0.1">
            </div>
            <div>
                <label>Fréquence respiratoire :</label>
                <input type="number" name="respiratoryRate">
            </div>
            <div>
                <label>Température corporelle (°C) :</label>
                <input type="number" name="bodyTemperature" step="0.1">
            </div>
            <div>
                <label>Fréquence cardiaque :</label>
                <input type="number" name="heartRate">
            </div>
            <div>
                <label>Tension artérielle (mmHg) :</label>
                <input type="number" name="bloodPressure" step="0.1">
            </div>
        </div>

        <div class="form-buttons">
            <button type="submit" class="btn">Enregistrer</button>
            <button type="reset" class="btn btn-secondary">Annuler</button>
        </div>
    </form>
</div>
</body>
</html>
