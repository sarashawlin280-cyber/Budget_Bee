
import 'package:flutter/material.dart';
import 'package:budget_bee/screens/catagories/categories.dart';
import 'package:budget_bee/screens/catagories/budget_report_screen.dart';
import 'package:budget_bee/screens/money_tracking/tracking_page.dart';
import 'package:budget_bee/screens/money_tracking/debt_page.dart';

class HomePage extends StatefulWidget{
  final String userName;

  const HomePage({super.key, required this.userName});

  @override
  State<HomePage> createState()=> _HomePageState();
}
class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
            backgroundColor:Colors.black,
            appBar:AppBar(
              backgroundColor:Colors.orangeAccent,
              title:Row(
                children: const [
                  Icon(
                    Icons.account_balance_wallet,
                    color:Colors.black,
                  ),
                  SizedBox(width:10),
                  Text("Budget_Bee",
                    style:TextStyle(
                      color:Colors.black,
                      fontWeight:FontWeight.bold,
                      fontSize:22,
                    ),
                  ),


                ],
              ),
            ),

            body:Column(
                mainAxisAlignment:MainAxisAlignment.start,
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  Center(
                    child:Text("Welcome to Tisha",
                      style:TextStyle(
                        color:Colors.white,
                        fontSize:20,
                        fontWeight:FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height:10),
                  Container(
                      width:double.infinity,
                      padding:EdgeInsets.all(5.0),
                      decoration:BoxDecoration(
                        color:Colors.white,
                        border:Border.all(color:Colors.black,width:0.5),
                        borderRadius:BorderRadius.circular(5),
                      ),
                      child:Column(
                        children: [
                          Center(
                            child:Text("Total Balance",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize:20,
                                fontWeight:FontWeight.bold,

                              ),
                            ),
                          ),
                          Center(
                            child:Text("1500",
                              style:TextStyle(
                                color:Colors.black,
                                fontSize:20,

                              ),
                            ),
                          ),

                        ],
                      )


                  ),
                  SizedBox(height:50),

                  SizedBox(width:double.infinity,

                    child:ElevatedButton(
                      onPressed:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context)=> categories(),
                          ),
                        );
                      },
                      child:Text("categories",
                        style:TextStyle(
                          color:Colors.black,
                          fontSize:20,
                          //fontWeight:FontWeight.bold,

                        ),
                      ) ,
                    ),
                  ),
                  SizedBox(width:double.infinity,

                    child:ElevatedButton(
                      onPressed:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context)=>  BudgetReportScreen(),
                          ),
                        );
                      },
                      child:Text("Budget Report",
                        style:TextStyle(
                          color:Colors.black,
                          fontSize:20,
                          //fontWeight:FontWeight.bold,

                        ),
                      ) ,
                    ),
                  ),
                  SizedBox(width:double.infinity,

                    child:ElevatedButton(
                      onPressed:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context)=> const TrackingPage(),
                          ),
                        );
                      },
                      child:Text("Tracking",
                        style:TextStyle(
                          color:Colors.black,
                          fontSize:20,
                          //fontWeight:FontWeight.bold,

                        ),
                      ) ,
                    ),
                  ),
                  SizedBox(width:double.infinity,

                    child:ElevatedButton(
                      onPressed:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context)=> const DebtPage(),
                          ),
                        );
                      },
                      child:Text("Debt and Lending",
                        style:TextStyle(
                          color:Colors.black,
                          fontSize:20,
                          //fontWeight:FontWeight.bold,

                        ),
                      ) ,
                    ),
                  ),







                ]
            )
        );

  }
}
