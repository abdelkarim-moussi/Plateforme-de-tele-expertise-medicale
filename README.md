### 🏥 Système de Télé-Expertise Médicale
📌 Contexte du projet

Ce projet consiste à concevoir et développer un système de télé-expertise médicale permettant d’optimiser le parcours patient et de renforcer la collaboration entre médecins généralistes et médecins spécialistes.

L’objectif principal est de faciliter la demande d’avis médical à distance, afin d’améliorer la qualité de la prise en charge, réduire les délais de diagnostic et assurer une coordination efficace entre les différents acteurs de santé.

Le système couvre l’ensemble du parcours du patient depuis son arrivée à l’hôpital jusqu’à la clôture de la consultation, avec ou sans recours à une expertise spécialisée.

🎯 Objectifs

Optimiser le parcours patient à l’hôpital

Centraliser les informations administratives et médicales

Faciliter la télé-expertise entre généralistes et spécialistes

Réduire les délais de prise de décision médicale

Améliorer la qualité et la traçabilité des soins

Assurer une communication médicale sécurisée

👥 Acteurs du système
Rôle	Description
Infirmier	Accueil du patient, saisie des données administratives et des signes vitaux
Médecin Généraliste	Consultation, diagnostic, prescription, demande d’expertise
Médecin Spécialiste	Fournit un avis médical expert
Administrateur (bonus)	Gestion du personnel médical
🔄 Processus fonctionnel
1️⃣ Arrivée et enregistrement du patient

L’infirmier :

Saisit les données administratives (identité, sécurité sociale, mutuelle)

Renseigne les données médicales (antécédents, allergies, traitements)

Mesure les signes vitaux :

Tension artérielle

Fréquence cardiaque

Température

Fréquence respiratoire

Poids et taille

2️⃣ File d’attente

Le patient est automatiquement ajouté à la file d’attente

Consultation selon l’ordre d’arrivée

3️⃣ Consultation chez le médecin généraliste

Le généraliste :

Consulte le dossier patient

Effectue l’examen clinique

Analyse les symptômes

Crée une consultation avec ses observations

4️⃣ Décision de prise en charge
🔹 Scénario A : Prise en charge directe

Diagnostic

Prescription du traitement

Clôture de la consultation
Statut : TERMINEE

🔹 Scénario B : Télé-expertise médicale

Demande d’avis spécialiste

Statut : EN_ATTENTE_AVIS_SPECIALISTE

Sélection de la spécialité

Recherche des spécialistes (Stream API)

Vérification des créneaux disponibles

Création de la demande avec :

Question médicale

Priorité (URGENTE / NORMALE / NON URGENTE)

Notification du spécialiste

💬 Modalités de communication
Télé-expertise synchrone

Visioconférence ou appel

Discussion en temps réel

Réponse immédiate

Télé-expertise asynchrone

Transmission du dossier via la plateforme

Analyse par le spécialiste

Réponse écrite sous 24 à 48 heures

📋 Exigences fonctionnelles
🔐 Module Authentification

Login / Logout

Authentification stateful (sessions)

Rôles : Infirmier, Généraliste, Spécialiste

Sécurité : bcrypt + CSRF

👩‍⚕️ Module Infirmier

US1 : Accueil du patient

Recherche patient existant

Création nouveau patient

Saisie des signes vitaux

Ajout automatique à la file d’attente

US2 : Liste des patients

Patients du jour

Tri par heure d’arrivée

Filtrage par date (Stream API)

👨‍⚕️ Module Médecin Généraliste

US3 : Créer une consultation

Sélection du patient

Motif et observations

Coût fixe : 150 DH

US4 : Demander une expertise

Choix spécialité

Filtrage spécialistes (Stream API)

Sélection créneau

Question médicale

US5 : Calcul du coût total

Consultation + expertise + actes médicaux

Utilisation Lambda / map().sum()

👨‍⚕️ Module Médecin Spécialiste

US6 : Configurer le profil

Spécialité

Tarif

Durée consultation : 30 min

US7 : Gestion des créneaux

Créneaux prédéfinis

Mise à jour automatique (réservé / archivé)

US8 : Gérer les expertises

Liste des demandes

Filtrage par statut et priorité

Réponse et clôture

🧪 Actes techniques médicaux

Radiographie

Échographie

IRM

Électrocardiogramme

Actes dermatologiques (Laser)

Fond d’œil

Analyses de sang

Analyses d’urine

⭐ Bonus – Gestion du staff

Option 1 : Ajout du personnel via scripts SQL

Option 2 : Rôle Administrateur avec interface de gestion

🛠️ Exigences techniques

Java / Jakarta EE

Maven

HTTP

Servlet / JSP / JSTL

JPA / Hibernate

Tomcat / Jetty / Glassfish

Authentification par sessions

BCrypt (hachage mots de passe)

Protection CSRF

JUnit / Mockito (tests unitaires)

🧱 Architecture
JSP
 ↓
Servlet (Controller)
 ↓
Service (Logique métier)
 ↓
DAO / Repository
 ↓
Base de données
