import 'package:saurabh1/loading.dart';
import 'package:saurabh1/login.dart';
import 'package:saurabh1/signup.dart';
import 'fullnews.dart';
import 'home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(
      MaterialApp(
        initialRoute: '/login',
        routes: {
          '/':(context)=>Home(),
          '/loading':(context)=>Loading(),
          '/fullnews':(context)=>Fullnews(),
          '/signup' :(context)=>Signup(),
          '/login' :(context)=>Login()
        },
      )
  );
}
