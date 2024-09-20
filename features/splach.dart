import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'onboarding.dart';

class Splach extends StatefulWidget{
  @override
  State<Splach> createState() => _SplachState();
}

class _SplachState extends State<Splach> {
  @override
  void initState(){
    Timer(Duration(seconds: 5),(){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>OnBoardingPage()),(route) => false);


    });
    super.initState();
  }
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Color(0xFF281155),
    body:
        Center(
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("TO DO",style: TextStyle(fontSize: 45,fontWeight:FontWeight.bold,color: Colors.white,),),
               SizedBox(width: 20,),
               Icon(Icons.check,color: Colors.white,size: 50,)
             ],
           )),
   );
  }
}