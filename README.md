# Newsletter App

A Flutter application that allows users to sign up and post content. The app uses Firebase as the backend to store user information, post information, like count, and timestamps.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Backend Setup](#backend-setup)
- [Usage](#usage)
- [Screenshots](#screenshots)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)

## Introduction

The Newsletter App is a mobile application built using Flutter that enables users to sign up, log in, and post content. The app uses Firebase for backend services, including authentication, data storage, and real-time database updates.

## Features

- User authentication (sign up, log in, log out)
- Post content (text)
- Store user information and post information in Firebase
- Track like count and timestamp for each post
- View posts with real-time updates
- Like posts

## Installation

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) (version 2.0.0 or higher)
- [Dart](https://dart.dev/get-dart) (version 2.12.0 or higher)
- [Firebase CLI](https://firebase.google.com/docs/cli)
- Android Virtual Device (AVD)

### Steps

1. Clone the repository:

   ```sh
   git clone https://github.com/andrew-zurita/newsletter_app.git
   cd newsletter_app
2. Install the dependencies
  '''sh
  flutter pub get

3. Backend Setup

  A. Login to Firebase:

  '''sh
  firebase login

  B. Configure Firebase for your project:

  '''sh
  flutterfire configure

  - Select an existing project or create a new one.
  - Select the configuration support for Android only.
  - If prompted for a namespace, copy and paste "com.example.newsletter_app" into the terminal, or check the android/app/build.gradle file for the namespace variable and copy the assigned string.

  C. Set Up Firebase Authentication:

  - Go to the Firebase Console.
  - Navigate to the Authentication section.
  - Enable Email/Password authentication.
  
  D. Set Up Cloud Firestore:

  Navigate to the Firestore Database section in the Firebase Console.
  Create a new database and start in production mode.
  Change the security rules from "write: if false" to "write: if true" and publish the changes.

4. Add Firebase Dependencies:

'''sh
flutter pub add firebase_core
flutter pub add firebase_auth
flutter pub add cloud_firestore

5. Usage:

A. Connect your Android Virtual Device to your newsletter_app and in the main.dart file terminal run the following:

'''sh
flutter run