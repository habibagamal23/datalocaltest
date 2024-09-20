import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localdata_app/features/login_sginup/login_page.dart';
import 'package:localdata_app/features/login_sginup/signUp_page.dart';

import 'home/home_page.dart';

class OnBoardingPage extends StatelessWidget{
   OnBoardingPage({super.key});


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Color(0xFF281155),
     body: Padding(
       padding: const EdgeInsets.all(20.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
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
           SizedBox(height: 100,),
           Text("Organize your time with TO DO",style: TextStyle(fontSize: 30,color: Colors.white),),
           SizedBox(height: 150,),
           ElevatedButton(onPressed: (){
             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SignupPage()),(route) => false);
           }, child: Text("START",style: TextStyle(fontSize: 20,color: Color(0xFF281155),fontWeight: FontWeight.bold)))
         ],
       ),
     ),
   );
  }

}