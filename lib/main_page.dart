

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/check_login_register.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if(snapshot.hasData){
            return HomePage();
          }else{
            return CheckLogRegis();
          }
        }),
      ),
    );
  }
}