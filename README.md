# 🚀 Recast Designs - Food Menu Assessment

## 📌 Overview

This project is a **Premium Food Menu Application** built using **Flutter**.  
It follows **Clean Architecture** principles and applies **SOLID** and common **Design Patterns** to build a scalable, maintainable, and high-performance mobile system.

The project demonstrates advanced UI/UX techniques including Glassmorphism, Masonry layouts, and professional state management.

---

## 🏗️ Project Structure

Recast_Designs_Assessment
│
├── lib/core          # Presentation Layer (Constants, Themes, Utils, Errors)
├── lib/data          # Data Access Layer (Models, Repositories Implementation, Local Sources)
├── lib/domain        # Core Layer (Entities, Use Cases, Repository Interfaces)
└── lib/presentation  # Presentation Layer (BLoC, Screens, Components)

---

## 🧠 Architecture & Design

### ✅ Clean Architecture
- Clear separation of concerns (Data, Domain, Presentation)
- Dependency rule applied (Domain is independent)
- Highly maintainable and testable code

### ✅ SOLID Principles
- Single Responsibility Principle (Modular Widgets)
- Dependency Inversion (Interface-based Repositories)
- Open/Closed Principle (Extensible UI Components)

### ✅ Design Patterns
- Repository Pattern
- BLoC Pattern (State Management)
- Singleton Pattern (Dependency Injection)

---

## 🎨 UI/UX Features

- **Masonry Grid:** Modern dynamic list using `SliverMasonryGrid`.
- **Glassmorphism:** Premium badges using `BackdropFilter` and `ShaderMask`.
- **Hero Animations:** Smooth image transitions between screens.
- **Smart Text Handling:** Dynamic "Read More" logic via `TextPainter`.
- **Toast:** Show When added item to order`FlutterToast`.

---

## ⚙️ State Management

- **Flutter BLoC/Cubit**
- Global handling for:
    - `Loading State` (Shimmer Effect)
    - `Success State` (Data Rendered)
    - `Error State` (Handled via Exception Middleware)

---

## 🛠️ Technologies Used

- Flutter 3.x / Dart
- BLoC (State Management)
- Shimmer (Loading UI)
- ScreenUtil (Responsive Design)
- Google Fonts (Satoshi Typography)
- JSON Local Assets

---

## 📦 Features

- Responsive masonry food menu
- Detailed view with preparation info
- Glass-style price and trending badges
- Expandable/Collapsible descriptions
- Professional Shimmer loading effect

---

## 📸 Screenshots

### 🔹 Home Screen – Masonry Grid
![Home Screen](assets/screenshots/ScreenShot1.jpg) ![Home Screen](assets/screenshots/ScreenShot2.jpg) ![Home Screen](assets/screenshots/ScreenShot3.jpg)

### 🔹 Food Item Details
![Details Screen](assets/screenshots/ScreenShot4.jpg)

### 🔹 Logic: Read More & Show Less
![UX Logic](assets/screenshots/ScreenShot5.jpg)

### 🔹 Success: Added to Order
![Added To Order Success](assets/screenshots/ScreenShot6.jpg)

---

## ▶️ How to Run the Project

1. Clone the repository:

```bash
git clone [https://github.com/EzatEbrahem/Food-Menu-Assessment.git]
```

2. Get dependencies:

```bash
flutter pub get
```
3. Run the project 🚀

```bash

flutter run
```