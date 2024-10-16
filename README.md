# Temperature Conversion Application

## Table of Contents
1. [Introduction](#introduction)
2. [Features](#features)
3. [Project Architecture](#project-architecture)
4. [Codebase Overview](#codebase-overview)
5. [Key Components](#key-components)
6. [How to Run the Project](#how-to-run-the-project)
7. [Future Improvements](#future-improvements)
8. [License](#license)

---

## Introduction
The **Temperature Conversion Application** is a simple and interactive mobile app built using **Flutter**. It allows users to convert temperatures between Fahrenheit and Celsius using predefined conversion formulas. The app also provides a feature to switch between **light** and **dark** themes, offering a user-friendly experience in different lighting conditions.

The app's primary purpose is to demonstrate the basic use of state management in Flutter, theming, and simple conversion calculations. It also includes a feature to keep a history of conversions, allowing users to track their previous calculations.

---

## Features
- **Temperature Conversion**: Users can input a temperature and convert it between Fahrenheit and Celsius.
- **Theme Switching**: The app supports both light and dark themes, with a toggle button in the AppBar.
- **Conversion History**: Displays a log of all previous conversions performed during the session.
- **Responsive Design**: The app adapts seamlessly to both portrait and landscape orientations.

---

## Project Architecture
The architecture of the project follows the **Flutter** framework’s standard structure, with widgets being the primary building blocks. The app utilizes **StatefulWidgets** to manage state changes (e.g., conversion and theme toggling).

### Directory Structure:


---

## Codebase Overview

### `main.dart`
This file contains all the core logic of the application. It defines two main widgets:

- **TemperatureConverterApp**: This is the root widget that manages the theme switching and sets up the core layout for the app.
- **TemperatureConverter**: This widget contains the user interface and logic for converting temperatures and displaying the conversion history.

---

## Key Components

### 1. **Theme Management**
The app supports both light and dark themes. The theme switching is implemented using a **StatefulWidget** (`_TemperatureConverterAppState`) that toggles between `ThemeMode.light` and `ThemeMode.dark`.

- **Light Theme**: Uses a **purple** color scheme for the AppBar and buttons.
- **Dark Theme**: Uses a **deep purple** color scheme for the AppBar and buttons.
  
The `IconButton` in the AppBar allows users to switch between the two themes by calling the `_toggleTheme()` function.

### 2. **Temperature Conversion Logic**
The temperature conversion is handled by the method `convertTemperature()` inside the `TemperatureConverter` widget. It reads the user input, performs the appropriate conversion based on the switch's position (Fahrenheit to Celsius or Celsius to Fahrenheit), and updates the converted value.

- Formulae used:
  - °F = °C × 9/5 + 32
  - °C = (°F - 32) × 5/9
  
The converted value is displayed in two decimal places using the `toStringAsFixed(2)` method.

### 3. **Conversion History**
Each time a conversion is performed, the app adds the result to the `conversionHistory` list. This list is displayed using a `ListView.builder`, which dynamically generates a list of all previous conversions.

### 4. **UI Elements**
- **TextField**: Accepts user input for the temperature to be converted.
- **Switch**: Toggles between Fahrenheit-to-Celsius and Celsius-to-Fahrenheit conversion modes.
- **ElevatedButton**: Triggers the conversion when pressed.
- **ListView.builder**: Displays the history of conversions.

### 5. **Orientation Support**
The layout is responsive and works well in both portrait and landscape orientations without losing functionality or aesthetics.

---

## How to Run the Project

### Prerequisites:
- Install Flutter SDK: [Flutter installation guide](https://flutter.dev/docs/get-started/install)
- Set up an editor like VS Code or Android Studio.
- Connect an emulator or physical device.

### Steps to Run:
1. Clone the repository:
    ```bash
    git clone <repository-url>
    cd temperature-conversion-app
    ```
2. Open the project in your code editor (VS Code, Android Studio, etc.).
3. Ensure you have a connected device or emulator running.
4. Run the application using:
    ```bash
    flutter run
    ```

### To Hot Reload:
- Save the code changes and type `r` in the terminal if using VS Code or Android Studio to see changes immediately.

### To Hot Restart:
- Type `R` in the terminal.

---

## Future Improvements
- **Error Handling**: Add better validation and error handling for incorrect or empty inputs.
- **Persistent Storage**: Store conversion history locally using a database or shared preferences, so it remains even after the app is closed.
- **Multiple Units**: Expand the app to support additional temperature units (e.g., Kelvin).
- **User Settings**: Provide more customization options, such as selecting default conversion mode or managing history.

---

## License
This project is open-source and available under the MIT License.
