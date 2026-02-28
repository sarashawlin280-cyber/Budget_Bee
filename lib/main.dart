/*
import 'package:flutter/material.dart';
import 'tracking_page.dart'; // Import the second file

void main() {
  runApp(const BudgetBeeApp());
}

class BudgetBeeApp extends StatelessWidget {
  const BudgetBeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BudgetBee Tracker',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      // This tells the app to load the TrackingPage from the other file
      home: const TrackingPage(),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'screens/home_page/debt_page.dart';

void main() => runApp(const BudgetBee());

class BudgetBee extends StatelessWidget {
  const BudgetBee({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const DebtPage(),
    );
  }
}

