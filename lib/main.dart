import 'package:flutter/material.dart';
import 'screens/home_page/log_in.dart';

void main(){
  runApp(BudgetBeeApp());
}

class BudgetBeeApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: log_inPage(),
    );
  }
}
//probably done