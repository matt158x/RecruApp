# RecruApp is a mobile app for detecting an outlier number in a set of integers, built with Flutter.

RecruApp is a simple mobile application that allows users to input a list of integers and automatically detect the outlier value — a number that differs in parity (even/odd) from the rest of the dataset.

✨ Key Features

🔍 Outlier Detection – Finds the single number that differs in parity from the rest
🧠 Smart Validation – Detects missing even/odd numbers and ambiguous input cases
🛠 Auto-Fix Mechanism – Automatically corrects invalid input on user request
✍️ Input Normalization – Handles extra commas, misplaced minus signs, and malformed input
⚠️ User Decisions – Allows users to continue, auto-fix, or manually adjust invalid input
📱 Cross-Platform – Runs on both Android and iOS
🎨 Modern UI

🧩 How It Works

1. The user enters a list of integers separated by commas
   
Example:
<img width="172" height="44" alt="Zrzut ekranu 2025-12-17 o 03 27 42" src="https://github.com/user-attachments/assets/6be73f48-2f29-4679-81ff-b2afcd63327e" />

2. The app:
- normalizes the input (removes extra commas, fixes malformed negatives)
- validates the data
- detects the majority parity
- finds and displays the outlier

3. If the input is ambiguous (e.g. more than one possible outlier), the user can:

✔ Auto-fix the input
✍️ Fix it manually
▶ Continue anyway - The application will return the first number in the array that does not match the others


🛠 Technologies Used
- Flutter
- Dart
- go_router
- Clean Architecture
- SOLID principles
- Material Design 3

▶️ Build & Run
Requirements:
- Flutter SDK (stable)
- Android Studio or VS Code
- Android Emulator or physical device

Run the app:
<img width="534" height="59" alt="Zrzut ekranu 2025-12-17 o 03 33 42" src="https://github.com/user-attachments/assets/6bb07f12-d9a6-452a-bc49-270a46c70937" />
