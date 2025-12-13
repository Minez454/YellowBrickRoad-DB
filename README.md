# 🧱 Yellow Brick Road: The Survival System

> **"Not just an app. A survival infrastructure."**

Yellow Brick Road is a survivor-led technology platform designed to end homelessness through total systems integration. It replaces bureaucratic friction with **emotional scaffolding**, guided by **Brick**, a trauma-informed AI companion.

## 🏗️ Technical Architecture

This repository hosts the complete survival architecture, built with:

### 1. 🧠 Brick's Brain (Database)
* **Location:** `/database_schema.sql`
* **Function:** Stores `UserStates` (Survival vs. Burnout Mode), `EmotionalLogs` for mental health tracking, and modular `WorkbookSteps` for navigating bureaucracy.

### 2. 👂 The Backend Bridge (API)
* **Location:** `/backend/server.js`
* **Function:** A Node.js/Express server that listens for user signals.
    * **Emotional Check-ins:** Detects "Overwhelm" and triggers Burnout Mode.
    * **Workbook delivery:** Serves custom step-by-step survival guides.

### 3. 📱 The Mobile Experience (Flutter App)
* **Location:** `/yellow_brick_road_app`
* **Core Logic:** `/lib/services/brick_service.dart`
* **Function:** A React Native/Flutter interface that speaks directly to the backend. It includes a "Panic Button" logic that instantly connects users to Brick's API.

---

## 🚀 Key Features Implemented

* **Trauma-Informed State Machine:** The system detects if a user is in *Survival*, *Burnout*, or *Crisis* mode and adapts the UI accordingly.
* **Modular Workbooks:** Instead of a static list, users receive dynamic, step-by-step guides for ID Recovery, Housing, and Legal Aid.
* **Agency Integration:** (In Progress) API endpoints designed to autofill forms and track referrals.

## 🛠️ How to Run

1.  **Backend:** Navigate to `/backend` and run `node server.js` to start Brick's listening engine.
2.  **Frontend:** Navigate to `/yellow_brick_road_app` and run `flutter run` to launch the mobile interface.

---

*Built with dignity, logic, and lived experience.*
