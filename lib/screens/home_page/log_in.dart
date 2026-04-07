import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';

class log_inPage extends StatefulWidget{
  const log_inPage({super.key});

  @override
  State<log_inPage> createState() => _log_inPageState();
}

class _log_inPageState extends State<log_inPage>{

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // LOGIN FUNCTION
  Future<void> _handleLogin() async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context)=> HomePage(userName:'Tisha'),
        ),
      );

    } on FirebaseAuthException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? "Login Failed"))
      );
    }
  }

  // SIGNUP FUNCTION
  Future<void> _handleSignUp() async {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Account Created"))
      );

    } on FirebaseAuthException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? "Signup Failed"))
      );
    }
  }

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
              border:Border.all(color:Colors.black,width:1.0),
              borderRadius:BorderRadius.circular(5),
            ),
            child:TextField(
              controller:_emailController,
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
              controller:_passwordController,
              obscureText:true,
              decoration:InputDecoration(
                labelText:"Password",
                border:InputBorder.none,
              ),
            ),
          ),

          SizedBox(height:10),

          ElevatedButton(
            onPressed: _handleLogin,
            child: Text("Log In",
              style: TextStyle(
                color:Colors.black,
              ),
            ),
          ),

          ElevatedButton(
            onPressed: _handleSignUp,
            child: Text("SignUp",
              style: TextStyle(
                color:Colors.black,
              ),
            ),
          ),



        ],
      ),
    );
  }
}