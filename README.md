# MatchMate – AI Powered Matchmaking App 💖

MatchMate is an AI-powered matchmaking iOS application built using SwiftUI, MVVM architecture, Core Data, and REST APIs.
The app demonstrates modern iOS development practices including offline support, clean architecture, asynchronous networking, local persistence, and intelligent matchmaking concepts.

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

* Swift Concurrency (`async/await`)
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
* Async/Await
* REST API
* Xcode 16+

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
* Xcode 16+
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

*Add screenshots here*

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
