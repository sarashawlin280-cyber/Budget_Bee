# 🐝 Budget Bee  
### *Take control. Crush debt. Grow your hive.*

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Platform](https://img.shields.io/badge/iOS-Android-black?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

---

## 🧠 What is Budget Bee?

**Budget Bee** is a modern, dark-mode personal finance tracker built with Flutter.  
It helps you:

- ✅ Track daily expenses  
- ✅ Monitor and eliminate debt  
- ✅ Visualize financial progress  
- ✅ Build better money habits  

Designed with a sleek AMOLED-first interface — because your finances deserve clarity.

---

## 🌙 Why Budget Bee?

Managing money shouldn’t feel overwhelming.

Budget Bee focuses on:

- Simplicity  
- Speed  
- Clean UI  
- Clear insights  

No bloated features. No distractions. Just control.

---

## ✨ Core Features

### 🖤 Pure Dark UI
Battery-friendly, OLED-optimized dark theme.

### 💳 Expense Tracking
Log, categorize, and review spending quickly.

### 📉 Debt Payoff Tracking
Supports:
- Snowball Method
- Avalanche Method  

Track balances, payments, and payoff progress.

### 📊 Visual Insights *(Coming Soon)*
- Spending breakdown charts  
- Debt progress graphs  
- Monthly summaries  

### 📱 Cross-Platform
Runs smoothly on:
- Android  
- iOS  

---

## 📸 Screenshots

| Dashboard | Debt Overview | Expense Entry |
|-----------|---------------|---------------|
| <img src="assets/screenshot_1.png" width="220"/> | <img src="assets/screenshot_2.png" width="220"/> | <img src="assets/screenshot_3.png" width="220"/> |

> Replace images in the `assets/` folder with your actual screenshots.

---

## 🏗 Tech Stack

| Layer | Technology |
|-------|------------|
| Framework | Flutter |
| Language | Dart |
| State Management | Provider / Riverpod *(update as needed)* |
| Local Storage | Hive / SQFLite / SharedPreferences |
| Architecture | Feature-based structure |

---

## 📂 Project Structure

```bash
lib/
│
├── main.dart
│
├── core/              # Constants, utilities, themes
│
├── models/            # Data models (Expense, Debt, Category)
│
├── services/          # Business logic & local storage
│
├── features/
│   ├── home/
│   ├── expenses/
│   ├── debts/
│   └── analytics/
│
├── widgets/           # Reusable UI components
│
└── theme/             # App styling and dark theme