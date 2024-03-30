import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyRegister extends StatelessWidget {
  final Function changeLogin;

  MyRegister({super.key, required this.changeLogin});

  //text controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  void signUp(BuildContext context) async {
    if (checkMatch()) {
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('The password and confirm password is not match'),
        ),
      );
    }
  }

  bool checkMatch() {
    if (passwordController.text.trim() ==
        passwordConfirmController.text.trim()) {
      return true;
    } else {
      return false;
    }
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

              //Password Field
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white70,
                    border: Border.all(width: 2, color: Colors.white)),
                child: TextField(
                  controller: passwordConfirmController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Confirm Password'),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              //SignIn button
              GestureDetector(
                onTap: () {
                  signUp(context);
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
                    'Sign Up',
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

              //Register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Have a account? ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      changeLogin();
                    },
                    child: const Text(
                      'Login now',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
