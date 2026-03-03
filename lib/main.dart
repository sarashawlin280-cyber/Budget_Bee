import 'package:flutter/material.dart';
import 'screens/home_page/log_in.dart';

void main() {
  runApp(const BudgetBeeApp());
}

class BudgetBeeApp extends StatelessWidget {
  const BudgetBeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BudgetBee',
      // Standardizing the dark theme across the app
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(
          primary: Colors.orangeAccent,
          secondary: Colors.amber,
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}