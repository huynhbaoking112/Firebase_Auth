import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/pages/forgot_page.dart';
import 'package:google_fonts/google_fonts.dart';

class MyLogin extends StatefulWidget {

  final Function changeRegis;

  const MyLogin({super.key, required this.changeRegis});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  //text controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future signIn() async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }



  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //icon android
              const Center(
                  child: Icon(
                Icons.android,
                size: 100,
              )),

              //HelloAgain!
              Center(
                child: Text(
                  'HELLO AGAIN!',
                  style: GoogleFonts.bebasNeue(fontSize: 52),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              //Welcome back
              const Text(
                'Welcome back, you\'ve been missed!',
                style: TextStyle(fontSize: 20),
              ),

              const SizedBox(
                height: 50,
              ),

              //Email Field
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white70,
                    border: Border.all(width: 2, color: Colors.white)),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Email'),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              //Password Field
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white70,
                    border: Border.all(width: 2, color: Colors.white)),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Password'),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              //SignIn button
              GestureDetector(
                onTap: (){
                  signIn();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12)),
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 20),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),


              GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ForgotPage(),));
                },
                child: Text('Forgot Password?' ,style: TextStyle(
                  fontWeight: FontWeight.w500
                ),),
              ),
              
              const SizedBox(
                height: 20,
              ),



              //Register now
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a member? ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.changeRegis();
                    },
                    child:const Text(
                      'Register now',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blueAccent),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
