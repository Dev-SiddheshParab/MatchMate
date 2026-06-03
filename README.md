# MatchMate – Matchmaking App 💖

MatchMate is a matchmaking iOS application built using SwiftUI, MVVM architecture, Core Data, and REST APIs.
The app demonstrates modern iOS development practices including offline support, clean architecture, asynchronous networking and local persistence concepts.

## ✨ Features

### 🔐 User Onboarding

* Beautiful onboarding flow using SwiftUI
* Smooth animations and modern UI components
* User-friendly navigation experience

### 👤 Profile Listing

* Fetch profiles from remote API
* Display match recommendations
* Dynamic filtering support

### ❤️ Accept / Decline Match Requests

* Users can accept or decline profiles
* Real-time UI updates
* Status-based filtering

### 📦 Offline Support

* Core Data integration for local persistence
* Cached profiles available offline
* Duplicate prevention using merge policies

### 🤖 AI Matchmaking Concept

* AI-ready architecture for compatibility scoring
* Future scope for LLM integration
* Smart recommendation engine design

### ⚡ Modern iOS Development

* Swift Concurrency
* MVVM Architecture
* Observable ViewModels
* Reusable SwiftUI components
* Clean and scalable code structure

---

# 🏗️ Architecture

The application follows the **MVVM (Model-View-ViewModel)** architecture.

## Layers

### Model

Handles data structures and Core Data entities.

### View

SwiftUI screens and reusable UI components.

### ViewModel

Business logic, API handling, filtering, and state management.

### Service Layer

Responsible for:

* API calls
* Local database operations
* Data synchronization

---

# 🛠️ Tech Stack

* Swift 6
* SwiftUI
* MVVM
* Core Data
* Swift Concurrency
* REST API
* Xcode 26+

---

# 📱 Screens

* Onboarding Screen
* Profile Listing
* Profile Details
* Accept/Decline Actions
* Filtered Match Requests

---

# 🚀 Installation

## Requirements

* macOS
* Xcode 26+
* iOS 17+

## Steps

1. Clone the repository

```bash
git clone <repository-url>
```

2. Open the project in Xcode

```bash
open MatchMate.xcodeproj
```

3. Run the app on simulator or physical device

---

# 📂 Project Structure

```bash
MatchMate/
│
├── Models/
├── Views/
├── ViewModels/
├── Services/
├── Database/
├── Resources/
└── Utilities/
```

---

# 📸 Screenshots

<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 - 2026-06-03 at 16 43 54" src="https://github.com/user-attachments/assets/dc67ae30-9ced-4a72-91c7-4aff7c286780" />

<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 - 2026-06-03 at 16 42 44" src="https://github.com/user-attachments/assets/19547057-0b2d-498b-97fa-d66c27e0acf4" />

<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 - 2026-06-03 at 16 43 01" src="https://github.com/user-attachments/assets/2d9654ba-e22a-4fba-a35d-fa4e1f5a2ca5" />

---

# 🎯 Learning Outcomes

This project helped in understanding:

* SwiftUI app architecture
* Offline-first applications
* Core Data persistence
* Async API handling
* State management
* Reusable UI design
* Scalable iOS project structure

---

# 👨‍💻 Author

Siddhesh Parab
iOS Developer

---

# 📄 License

This project is for learning and demonstration purposes.
