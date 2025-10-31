# 🏦 MiniBank - Simple Mobile Banking App

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

**A secure, minimal, and feature-rich mobile banking application built with Flutter**

[Features](#-features) • [Screenshots](#-screenshots) • [Installation](#-installation) • [Usage](#-usage) • [Architecture](#-architecture) • [Contributing](#-contributing)

</div>

---

## Table of Contents

- [About](#-about)
- [Features](#-features)
- [Screenshots](#-screenshots)
- [Tech Stack](#-tech-stack)
- [Installation](#-installation)
- [Firebase Setup](#-firebase-setup)
- [Project Structure](#-project-structure)
- [Usage](#-usage)
- [Architecture](#-architecture)
- [API Reference](#-api-reference)
- [Security](#-security)
- [Roadmap](#-roadmap)
- [Contributing](#-contributing)
- [License](#-license)
- [Contact](#-contact)

---

## About

**MiniBank** is a modern, secure mobile banking application that provides essential banking features in a clean and intuitive interface. Built with Flutter and Firebase, it offers real-time transaction processing, multi-language support, and a seamless user experience across both iOS and Android platforms.

### Why MiniBank?

-  **Simple & Intuitive** - Clean UI/UX for effortless navigation
-  **Secure** - Firebase Authentication & Firestore security rules
-  **Multi-Language** - Support for English, French, and Arabic
-  **Customizable** - Dark/Light themes with system preference
-  **Real-Time** - Instant balance updates and transaction notifications
-  **Cross-Platform** - Single codebase for iOS and Android

---

##  Features

###  Authentication
- Email/password registration and login
- Secure Firebase Authentication
- Auto-generated unique account numbers
- Session management

###  Banking Operations
- **View Balance** - Real-time account balance display
- **Transfer Money** - Send money to other users via email
- **Deposit Requests** - Submit deposit requests (simulated bank processing)
- **Withdrawal Requests** - Request withdrawals with balance verification
- **Transaction History** - Complete transaction log with filtering

###  User Experience
- **Multi-Language Support** - English, French, Arabic (RTL support)
- **Theme Modes** - Light, Dark, and System themes
- **Pull-to-Refresh** - Update data with a simple swipe
- **Currency Converter** - Real-time exchange rates for 9+ currencies
- **Responsive Design** - Optimized for all screen sizes

###  Notifications (Ready for Integration)
- Transaction confirmations
- Money received alerts
- Request status updates

###  Transaction Management
- Detailed transaction history
- Filter by transaction type
- Transaction notes and timestamps
- Color-coded transaction indicators

---

## Screenshots

<div align="center">

### Authentication & Dashboard
<p align="center">
  <img src="https://github.com/user-attachments/assets/dd6c1b83-d58b-4fa7-8a18-2d0183cf280c" alt="Login Screen" width="250"/>
  <img src="https://github.com/user-attachments/assets/b4c254f2-e51e-4e22-bddb-facb8c9c538a" alt="Dashboard" width="250"/>
  <img src="https://github.com/user-attachments/assets/5421b277-b8b0-48ec-befe-1d343a7d2e3a" alt="Balance View" width="250"/>
</p>

### Transactions
<p align="center">
  <img src="https://github.com/user-attachments/assets/385816a4-b54e-47b4-8799-565a1a7b6518" alt="Transfer Money" width="250"/>
  <img src="https://github.com/user-attachments/assets/fdd2971a-a435-4f1e-8edc-fff2494df9ec" alt="Transaction History" width="250"/>
  <img src="https://github.com/user-attachments/assets/a1f7055d-dbaa-401d-89dd-218f39a5ae3d" alt="Transaction Details" width="250"/>
</p>

### Settings & Features
<p align="center">
  <img src="https://github.com/user-attachments/assets/522a778d-0afa-45e8-999e-3fb08b5ae4d3" alt="Settings" width="250"/>
</p>

</div>
---

## Tech Stack

### Frontend
- **Framework:** Flutter
- **Language:** Dart 
- **State Management:** Provider
- **UI Components:** Material 3

### Backend & Services
- **Authentication:** Firebase Auth
- **Database:** Cloud Firestore
- **Storage:** SharedPreferences (local) + SQFLite (later)
- **API:** Exchange Rate API

### Libraries & Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # Firebase
  firebase_core: ^2.24.2
  firebase_auth: ^4.15.3
  cloud_firestore: ^4.13.6
  firebase_messaging: ^14.7.9
  
  # State Management
  provider: ^6.1.1
  
  # Local Storage
  shared_preferences: ^2.2.2
  
  # UI & Utilities
  intl: ^0.18.1
  http: ^1.1.2
  fl_chart: ^0.65.0
  flutter_local_notifications: ^16.3.0
```

---

##  Installation

### Prerequisites

Before you begin, ensure you have the following installed:
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.0 or higher)
- [Dart SDK](https://dart.dev/get-dart) (3.0 or higher)
- [Android Studio](https://developer.android.com/studio) or [Xcode](https://developer.apple.com/xcode/) (for iOS)
- [Firebase CLI](https://firebase.google.com/docs/cli)
- Git

### Step 1: Clone the Repository

```bash
git clone https://github.com/Abderrahamane/flutter-banking-app
cd flutter-banking-app
```

### Step 2: Install Dependencies

```bash
flutter pub get
```

### Step 3: Firebase Configuration

See [Firebase Setup](#-firebase-setup) section below.

### Step 4: Run the App

```bash
# For development
flutter run

# For release build (Android)
flutter build apk --release

# For release build (iOS)
flutter build ios --release
```

---

## 🔥 Firebase Setup

### 1. Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click **"Add Project"**
3. Enter project name: `minibank`
4. Follow the setup wizard

### 2. Configure Android App

```bash
# In Firebase Console
1. Click "Add app" → Select Android
2. Enter package name: com.example.minibank
3. Download google-services.json
4. Place in: android/app/google-services.json
```

**Update `android/build.gradle`:**
```gradle
buildscript {
    dependencies {
        classpath 'com.google.gms:google-services:4.3.15'
    }
}
```

**Update `android/app/build.gradle`:**
```gradle
apply plugin: 'com.google.gms.google-services'

android {
    defaultConfig {
        minSdkVersion 21
        targetSdkVersion 33
    }
}
```

### 3. Configure iOS App

```bash
# In Firebase Console
1. Click "Add app" → Select iOS
2. Enter bundle ID: com.example.minibank
3. Download GoogleService-Info.plist
4. Place in: ios/Runner/GoogleService-Info.plist
```

**Update `ios/Podfile`:**
```ruby
platform :ios, '12.0'
```

### 4. Enable Authentication

1. Go to **Authentication** → **Sign-in method**
2. Enable **Email/Password**
3. Click **Save**

### 5. Create Firestore Database

1. Go to **Firestore Database**
2. Click **Create Database**
3. Start in **Production Mode**
4. Choose location closest to your users

### 6. Set Firestore Security Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    
    // Users collection
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // Transactions collection
    match /transactions/{transactionId} {
      allow read: if request.auth != null && 
                  resource.data.userId == request.auth.uid;
      allow create: if request.auth != null;
      allow update, delete: if false; // Transactions are immutable
    }
    
    // Requests collection (deposits/withdrawals)
    match /requests/{requestId} {
      allow read, write: if request.auth != null && 
                         resource.data.userId == request.auth.uid;
    }
  }
}
```

### 7. Initialize Firebase in App

Firebase is already initialized in `lib/main.dart`:
```dart
await Firebase.initializeApp(options: ...);
```

---

## Project Structure

```
lib/
├── main.dart                      # App entry point
│
├── models/                        # Data models
│   └── transaction.dart          # Transaction model
│
├── providers/                     # State management
│   ├── auth_provider.dart        # Authentication logic
│   ├── banking_provider.dart     # Banking operations
│   ├── theme_provider.dart       # Theme management
│   └── locale_provider.dart      # Language management
│
├── screens/                       # UI screens
│   ├── auth/
│   │   ├── login_screen.dart
│   │   └── signup_screen.dart
│   ├── home/
│   │   └── dashboard_screen.dart
│   ├── transactions/
│   │   ├── transfer_screen.dart
│   │   ├── deposit_screen.dart
│   │   ├── withdraw_screen.dart
│   │   └── transaction_history_screen.dart
│   └── settings/
│       ├── settings_screen.dart
│       └── currency_converter_screen.dart
│
└── utils/                         # Utilities
    └── app_localizations.dart    # Localization support
```

---

## Usage

### Creating an Account

1. Launch the app
2. Tap **"Don't have an account? Sign up"**
3. Enter your details:
   - Full Name
   - Email
   - Password (min 6 characters)
4. Tap **Sign Up**
5. You'll receive $1000 starting balance

### Transferring Money

1. From dashboard, tap **Transfer**
2. Enter recipient's email
3. Enter amount
4. Add optional note
5. Tap **Transfer**
6. Confirm the transaction

### Requesting Deposit/Withdrawal

1. Tap **Deposit** or **Withdraw** from dashboard
2. Enter amount
3. Tap **Request**
4. Request is submitted for bank processing

### Viewing Transactions

1. Tap **History** from dashboard
2. View all transactions
3. Use filter menu to view specific types
4. Pull down to refresh

### Currency Conversion

1. Go to **Settings** → **Currency Converter**
2. Enter amount
3. Select currencies
4. Tap **Convert**

### Changing Theme/Language

1. Tap **Settings** icon
2. Select **Theme** (Light/Dark/System)
3. Select **Language** (English/Français/العربية)

---

## 🏗 Architecture

### Design Pattern: Provider (MVVM-inspired)

```
┌─────────────┐
│   Screens   │ ← User Interface (Views)
└──────┬──────┘
       │
       │ watches
       ↓
┌─────────────┐
│  Providers  │ ← Business Logic (ViewModels)
└──────┬──────┘
       │
       │ uses
       ↓
┌─────────────┐
│   Models    │ ← Data Models
└──────┬──────┘
       │
       │ interacts with
       ↓
┌─────────────┐
│   Firebase  │ ← Backend Services
└─────────────┘
```

### Key Components

#### **Providers**
- Manage app state
- Handle business logic
- Notify listeners of changes
- Interact with Firebase

#### **Models**
- Define data structure
- Parse Firebase documents
- Type-safe data handling

#### **Screens**
- Display UI components
- Listen to provider changes
- Handle user interactions

---

## API Reference

### Exchange Rate API

MiniBank uses the [ExchangeRate-API](https://exchangerate-api.com/) for currency conversion.

**Endpoint:**
```
GET https://api.exchangerate-api.com/v4/latest/{base_currency}
```

**Example Response:**
```json
{
  "base": "USD",
  "date": "2024-01-15",
  "rates": {
    "EUR": 0.85,
    "GBP": 0.73,
    "JPY": 110.33
  }
}
```

**Supported Currencies:**
- USD (US Dollar)
- EUR (Euro)
- GBP (British Pound)
- JPY (Japanese Yen)
- CAD (Canadian Dollar)
- AUD (Australian Dollar)
- CHF (Swiss Franc)
- CNY (Chinese Yuan)
- DZD (Algerian Dinar)
---

## Security

### Authentication
- Firebase Authentication with email/password
- Secure token-based session management
- Password requirements enforced (min 6 characters)

### Data Protection
- Firestore security rules prevent unauthorized access
- User data isolated by UID
- Transactions are immutable (no updates/deletes)

### Best Practices
- Never store sensitive data locally
- Always validate user input
- Use HTTPS for all network requests
- Implement rate limiting for API calls

### Firestore Rules Explanation

```javascript
// Users can only read/write their own data
allow read, write: if request.auth != null && 
                     request.auth.uid == userId;

// Transactions are immutable
allow update, delete: if false;
```

---

##  Roadmap

### Phase 1: Core Features 
- [x] User authentication
- [x] Dashboard with balance
- [x] Money transfers
- [x] Transaction history
- [x] Deposit/withdrawal requests
- [x] Multi-language support
- [x] Theme customization

### Phase 2: Enhanced Features 
- [ ] Push notifications
- [ ] Biometric authentication (fingerprint/face ID)
- [ ] QR code scanning for transfers
- [ ] Transaction receipts (PDF)
- [ ] Spending analytics with charts

### Phase 3: Advanced Features 
- [ ] Admin panel for request approvals
- [ ] Scheduled/recurring transfers
- [ ] Beneficiary management
- [ ] Bill payment integration
- [ ] Card management
- [ ] Loan calculator

### Phase 4: Enterprise Features 
- [ ] Multi-currency accounts
- [ ] Investment portfolio tracking
- [ ] AI-powered spending insights
- [ ] Chat support integration
- [ ] Web dashboard
- [ ] API for third-party integration

---

##  Contributing

Contributions are welcome! Here's how you can help:

### How to Contribute

1. **Fork the repository**
```bash
git clone https://github.com/Abderrahamane/flutter-banking-app
```

2. **Create a feature branch**
```bash
git checkout -b feature/AmazingFeature
```

3. **Commit your changes**
```bash
git commit -m 'Add some AmazingFeature'
```

4. **Push to the branch**
```bash
git push origin feature/AmazingFeature
```

5. **Open a Pull Request**

### Contribution Guidelines

- Follow the existing code style
- Write clear commit messages
- Add comments for complex logic
- Update documentation as needed
- Test your changes thoroughly
- Ensure no breaking changes

### Code Style

- Use meaningful variable names
- Follow Dart naming conventions
- Keep functions small and focused
- Add dartdoc comments for public APIs

### Reporting Bugs

If you find a bug, please create an issue with:
- Clear description
- Steps to reproduce
- Expected vs actual behavior
- Screenshots (if applicable)
- Device/OS information

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2024 MiniBank

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## Contact

**Project Maintainer:** Your Name

-  Email: abderrahmane.houri@ensia.edu.dz
-  LinkedIn: [later will be added](https://linkedin.com/in/yourusername)
-  Website: [leter will be added](https://yourwebsite.com)

**Project Link:** [https://github.com/Abderrahamane/flutter-banking-app](https://github.com/Abderrahamane/flutter-banking-app)

---

##  Acknowledgments

- [Flutter Team](https://flutter.dev) - Amazing framework
- [Firebase](https://firebase.google.com) - Backend infrastructure
- [ExchangeRate-API](https://exchangerate-api.com) - Currency conversion
- [Material Design](https://material.io) - Design system
- [Provider Package](https://pub.dev/packages/provider) - State management

---

## Project Stats

![GitHub stars](https://img.shields.io/github/stars/Abderrahamane/flutter-banking-app?style=social)
![GitHub forks](https://img.shields.io/github/forks/Abderrahamane/flutter-banking-app?style=social)
![GitHub issues](https://img.shields.io/github/issues/Abderrahamane/flutter-banking-app)
![GitHub pull requests](https://img.shields.io/github/issues-pr/Abderrahamane/flutter-banking-app)
![GitHub last commit](https://img.shields.io/github/last-commit/Abderrahamane/flutter-banking-app)
![GitHub repo size](https://img.shields.io/github/repo-size/Abderrahamane/flutter-banking-app)

---

##  Show Your Support

If you find this project helpful, please give it a ⭐️!

---

<div align="center">

**Built with ❤️ using Flutter**

[Back to Top](#-minibank---simple-mobile-banking-app)

</div>
