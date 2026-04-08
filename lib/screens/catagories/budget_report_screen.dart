import 'package:flutter/material.dart';

class BudgetReportScreen extends StatefulWidget {
  const BudgetReportScreen({super.key});

  @override
  State<BudgetReportScreen> createState() => _BudgetReportScreenState();
}

class _BudgetReportScreenState extends State<BudgetReportScreen> {

  List<int> values = [30, 15, 20, 25, 10];
  List<String> labels = ["Food", "Travel", "Shopping", "Bills", "Health"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,

      appBar: AppBar(
        title:  Text(
          "overall graph" ,
          style: TextStyle(color: Colors.yellow),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),

      body:  Padding(
        padding:  EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children:[




            Row(


              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children:List.generate(values.length,(index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: values[index] * 5.0,
                      width: 20,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      labels[index],
                      style:const TextStyle( color:Colors.black),
                    ),
                  ],

                );
              }),

            ),
          ],


        ),
      ),



    );



  }
}