import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class ForgotPage extends StatefulWidget {
   ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
   TextEditingController emailController = TextEditingController();

@override
void dispose(){
  emailController.dispose();
  super.dispose();

}

  

    Future forGot()async{
     try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
        showDialog(context: context, builder: (context) => AlertDialog(
          title: Text('The password reset email has been sent to your email account'),
        ),);
     } on FirebaseAuthException  catch (e) {
  print(e);
     }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center
          ,children: [

          Text('Enter your email!'),
          
          SizedBox(height: 20,),

          Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(width: 1.5),
            borderRadius: BorderRadius.circular(12)
          ),
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
              border: InputBorder.none
            ),
          ),
        ),

        SizedBox(height: 20,),

        ElevatedButton(onPressed:forGot, child: Text('ResetPassword!'))

        ],)
      ),
    );
  }
}