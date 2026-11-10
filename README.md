# Cipher App 

A Flutter application for encrypting and decrypting text with three classical cryptographic algorithms: **Caesar Cipher**, **Rail Fence Cipher**, and **Vigenère Cipher**.

The app provides a straightforward interface for selecting an algorithm, entering text, configuring the required key, and viewing the encrypted or decrypted result.

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-Framework-02569B?logo=flutter&logoColor=white" alt="Flutter" />
  <img src="https://img.shields.io/badge/Language-Dart-0175C2?logo=dart&logoColor=white" alt="Dart" />
  <img src="https://img.shields.io/badge/State%20Management-Cubit-764ABC" alt="Cubit" />
  <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS-3DDC84" alt="Platforms" />
</p>

##   Features

- **Encrypt and decrypt text** using three classical cipher algorithms.
- **Caesar Cipher:** Configure the shift key used to transform the text.
- **Rail Fence Cipher:** Set the number of rails used for the transposition.
- **Vigenère Cipher:** Use a custom keyword for polyalphabetic encryption.
- **Simple, user-friendly interface** built with Flutter and Material Design.
- **Cubit-based state management** to organize application state.

##   Supported Algorithms

| Algorithm | Key | Description |
| --- | --- | --- |
| Caesar Cipher | Numeric shift | Shifts letters by a configurable number of positions. |
| Rail Fence Cipher | Number of rails | Rearranges text using a zigzag writing pattern. |
| Vigenère Cipher | Keyword | Uses a repeating keyword to encrypt or decrypt text. |

All three algorithms support both **encryption** and **decryption**.

##   Tech Stack

- **Flutter** — Cross-platform UI framework.
- **Dart** — Application programming language.
- **Cubit** — State management.
- **Material Design** — User interface components and styling.

## 🚀 Getting Started

### Prerequisites

Make sure you have the following installed:

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart SDK](https://dart.dev/get-dart) (included with Flutter)
- Android Studio, VS Code, or another compatible IDE
- An Android emulator or a connected device

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/elghamry55/cipher_app.git
   ```

2. Navigate to the project directory:

   ```bash
   cd cipher_app
   ```

3. Install the dependencies:

   ```bash
   flutter pub get
   ```

4. Run the application:

   ```bash
   flutter run
   ```

##  Project Overview

The application is developed with Flutter and uses Cubit for state management. Each cipher provides its own encryption and decryption functionality, while the interface allows users to interact with the selected algorithm and its key.

##  Developer

**Mahmoud Elghamry**  
Flutter Developer

- GitHub: [@elghamry55](https://github.com/elghamry55)

---

If you find this project useful, feel free to explore the repository and leave a .
