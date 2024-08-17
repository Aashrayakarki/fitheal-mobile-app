# FitHeal Mobile App

Welcome to the **FitHeal** mobile app repository. FitHeal is a health and fitness platform designed to help users track their workouts, monitor their diet, and achieve their fitness goals, all from the convenience of their mobile devices.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Technologies](#technologies)
- [Installation](#installation)
- [Usage](#usage)

## Introduction

This repository contains the Flutter code for the FitHeal mobile application. The mobile app provides users with an intuitive interface to manage their fitness activities, track progress, and stay motivated on their health journey.

## Features

- **User Authentication:** Secure sign-up and login using Firebase Authentication.
- **Workout Management:** Create, update, delete, and view workout routines.
- **Diet Tracking:** Log meals, view nutritional information, and track diet progress.
- **Progress Tracking:** Visualize fitness progress with charts and graphs.
- **Push Notifications:** Get reminders for workouts and meal tracking.
- **Cross-Platform:** Runs seamlessly on both Android and iOS devices.

## Technologies

- **Flutter** - Cross-platform mobile framework by Google.
- **Dart** - Programming language used with Flutter.
- **Firebase** - Backend services for authentication, real-time database, and push notifications.
- **Provider** - State management for Flutter apps.
- **Hive** - Lightweight and fast NoSQL database for local storage.

## Installation

To set up and run the FitHeal mobile app locally, follow these steps:

1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/fitheal-flutter.git
    cd fitheal-flutter
    ```

2. Install dependencies:
    ```bash
    flutter pub get
    ```

3. Set up the environment variables:
   - Create a `.env` file in the root directory of the project.
   - Add the following environment variables:

    ```
    FIREBASE_API_KEY=your-firebase-api-key
    FIREBASE_AUTH_DOMAIN=your-firebase-auth-domain
    FIREBASE_PROJECT_ID=your-firebase-project-id
    FIREBASE_STORAGE_BUCKET=your-firebase-storage-bucket
    FIREBASE_MESSAGING_SENDER_ID=your-messaging-sender-id
    FIREBASE_APP_ID=your-firebase-app-id
    ```

4. Run the app:
    ```bash
    flutter run
    ```

    The app should now be running on your connected device or emulator.

## Usage

- **Home Screen:** Overview of your fitness stats and quick access to key features.
- **Workout Screen:** Manage and log workouts, view exercise history.
- **Diet Screen:** Track meals, view nutritional breakdown, and log dietary habits.
- **Progress Screen:** Monitor progress with detailed charts and graphs.
- **Settings:** Update profile information, manage app preferences, and configure notifications.
