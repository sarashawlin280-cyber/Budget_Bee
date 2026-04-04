import 'package:flutter/material.dart';
// The full path from the 'lib' folder:
import 'screens/money_tracking/debt_page.dart';

void main() {
  runApp(const BudgetBeeApp());
}

class BudgetBeeApp extends StatelessWidget {
  const BudgetBeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      // Now Flutter knows exactly where to find DebtPage
      home: const DebtPage(),
    );
  }
}