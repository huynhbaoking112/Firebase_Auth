


import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/register.dart';

class CheckLogRegis extends StatefulWidget {
  const CheckLogRegis({super.key});

  @override
  State<CheckLogRegis> createState() => _CheckLogRegisState();
}

class _CheckLogRegisState extends State<CheckLogRegis> {

  bool isLogin = true;

  void change(){
    setState(() {
      isLogin = !isLogin; 
    });
  }

  @override
  Widget build(BuildContext context) {
    if(isLogin){
      return MyLogin(changeRegis: change,);
    }else{
      return MyRegister(changeLogin: change);
    }
  }
}