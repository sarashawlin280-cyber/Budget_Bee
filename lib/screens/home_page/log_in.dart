import 'package:flutter/material.dart';
import 'home_page.dart';

class log_inPage extends StatelessWidget{
  const log_inPage({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(


        backgroundColor:Colors.yellow,
        body:Column(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment:CrossAxisAlignment.center,
          children:[
            SizedBox(height:20),
            Center(
              child:Text("Welcome to the page",
                style:TextStyle(
                  color:Colors.green,
                  fontWeight:FontWeight.bold,
                  fontSize:24,
                ),

              ),

            ),
            Center(
              child:Text("Start with log_in",
                style:TextStyle(
                  color:Colors.black,
                  fontSize:22,
                ),
              ),
            ),
            SizedBox(height:100),
            Container(
              width:double.infinity,
              padding:EdgeInsets.all(5.0),
              decoration:BoxDecoration(
                color:Colors.white,
                border:Border.all(color:Colors.black,width:0.5),
                borderRadius:BorderRadius.circular(5),
              ),
              child:TextField(

                decoration:InputDecoration(

                  labelText:"Username",
                  border:InputBorder.none,

                ),
              ),
            ),
            SizedBox(height:0.5),

            Container(
              width:double.infinity,
              padding:EdgeInsets.all(5.0),
              decoration:BoxDecoration(
                color:Colors.white,
                border:Border.all(color:Colors.black,width:1.0),
                borderRadius:BorderRadius.circular(5),


              ),
              child:TextField(
                decoration:InputDecoration(
                  labelText:"Email or Phone number",
                  border:InputBorder.none,
                ),
              ),
            ),
            SizedBox(height:0.5),

            Container(
              width:double.infinity,
              padding:EdgeInsets.all(5.0),
              decoration:BoxDecoration(
                color:Colors.white,
                border:Border.all(color:Colors.black,width:1.0),
                borderRadius:BorderRadius.circular(5),


              ),
              child:TextField(
                decoration:InputDecoration(
                  labelText:"Password",
                  border:InputBorder.none,
                ),
              ),
            ),
            SizedBox(height:10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(userName:'Tisha'),
                  ),
                );

              },
              child: Text("Log In",
                style: TextStyle(
                  color:Colors.black,
                ),

              ),
            )




          ],
        ),

      );

  }
}