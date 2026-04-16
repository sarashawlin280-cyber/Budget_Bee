import 'package:budget_bee/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Add this
import 'firebase_options.dart'; // Add this
//import 'screens/home_page/log_in.dart';
import 'splash_screen.dart';
import 'package:budget_bee/screens/home_page/log_in.dart';


void main() async {
  // 1. Initialize Flutter bindings
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(BudgetBeeApp());
}

class BudgetBeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home:const splash_screen(),
    );
  }
}