# 🏥 Application de Télé-Expertise Médicale

> **Technologies :** JDK 17 • Jakarta EE 10 • JSP/Servlets • Tomcat 10+ • MySQL • TailwindCSS

---

## 📖 Contexte du projet

L’application **MedicExpert** est un système de **télé-expertise médicale** visant à optimiser le parcours patient et à améliorer la coordination entre **médecins généralistes**, **spécialistes** et **infirmiers**.

Ce projet facilite la **collaboration médicale à distance**, permet un **partage rapide d’informations médicales** et une **prise en charge plus efficace** des patients.

---

## 🎯 Objectifs

- Digitaliser le parcours patient à l’hôpital (accueil, enregistrement, suivi)
- Améliorer la communication entre médecins généralistes et spécialistes
- Permettre au généraliste de demander un **avis à distance (télé-expertise)**
- Gérer les consultations, diagnostics et traitements en ligne

---

## 👩‍⚕️ Rôles et responsabilités

### 🧑‍⚕️ **Infirmier (Nurse)**
- Accueille le patient et saisit les informations administratives :
    - Identité, coordonnées, numéro de sécurité sociale, mutuelle
- Enregistre les **données médicales** :
    - Antécédents, allergies, traitements en cours
- Mesure les **signes vitaux** :
    - Tension artérielle
    - Fréquence cardiaque
    - Température corporelle
    - Fréquence respiratoire
    - Poids et taille
- Intègre automatiquement le patient dans la **file d’attente**

---

### 👨‍⚕️ **Médecin Généraliste**
- Accède au **dossier du patient** transmis par l’infirmier
- Réalise :
    - L’examen clinique
    - L’analyse des symptômes
    - La création d’une **consultation médicale**
- Deux scénarios possibles :
    1. **Prise en charge directe :**
        - Diagnostic et prescription de traitement
        - Clôture de la consultation
    2. **Demande de télé-expertise :**
        - Sélection d’une spécialité médicale (cardiologie, dermatologie, etc.)
        - Liste automatique des spécialistes disponibles (via Stream API)
        - Choix du spécialiste et envoi de la demande d’avis

---

### 👨‍🔬 **Médecin Spécialiste**
- Reçoit les **demandes de télé-expertise**
- Analyse le dossier et renvoie un **avis spécialisé**
- Peut planifier un créneau de télé-consultation
- Met à jour le statut de la consultation :  
  `EN_ATTENTE_AVIS_SPECIALISTE → TERMINEE`

---

## ⚙️ Architecture technique

### 🧱 Technologies principales
| Composant | Technologie                             |
|------------|-----------------------------------------|
| Backend | **Jakarta EE 10 (Servlets, JSP)**       |
| Frontend | **JSP + TailwindCSS**                   |
| Base de données | **PostgreSQL**                          |
| ORM | **Jakarta Persistence (JPA) Hibernate** |
| Serveur d’application | **Apache Tomcat 10/11**                 |
| Langage | **Java 17 (JDK 17)**                    |

---

## 🚀 Lancer l’application
# Prérequis

- JDK 17 installé

- Apache Tomcat 10 ou supérieur

- MySQL en service

- Maven configuré

## Étapes

### 1 Cloner le projet :

git clone  https://github.com/abdelkarim-moussi/Plateforme-de-tele-expertise-medicale

### 2 Configurer la base de données :

### 3 Créer une base de données medicExpert

### 4 Compiler et déployer :

### 5 mvn clean package

### 6 Déployer le fichier .war sur Tomcat

### 7 Accéder à l’application :
    http://localhost:8080/medicExpert/