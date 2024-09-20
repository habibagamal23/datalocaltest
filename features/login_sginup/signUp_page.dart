import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localdata_app/features/login_sginup/login_page.dart';

import '../../constant.dart';
import '../../core/shared.dart';

class SignupPage extends StatefulWidget{
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKeyS = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFF180e2b),
      body: Form(
        key: formKeyS,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("TO DO" ,style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold)),
                SizedBox(height: 25,),
                Text("Create your Account" ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
                SizedBox(height: 60,),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty || value == null){
                      return 'please enter your name';
                    }
                    return null;
                  },
                  decoration:
                  InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFccc2fe),
                      hintText: "UserName",
                      hintStyle: TextStyle(color: Color(0xFF180e2b)),
                      suffixIcon: Icon(Icons.person,color: Color(0xFF180e2b)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFccc2fe),),
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                  keyboardType: TextInputType.name,
                  controller: nameController,
                ),
                SizedBox(height: 30,),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty || value == null){
                      return 'please enter your email';
                    }
                    return null;
                  },
                  decoration:
                  InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFccc2fe),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Color(0xFF180e2b)),
                      suffixIcon: Icon(Icons.email,color: Color(0xFF180e2b)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFccc2fe),),
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                SizedBox(height: 30,),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty || value == null){
                      return 'please enter your password';
                    }
                    return null;
                  },
                  decoration:
                  InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFccc2fe),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Color(0xFF180e2b)),
                      suffixIcon: obscureText? Icon(Icons.remove_red_eye,color: Color(0xFF180e2b)):Icon(Icons.remove_red_eye_outlined,color: Color(0xFF180e2b)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFccc2fe),),
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  obscureText: obscureText,
                  obscuringCharacter: "*",
                ),
                SizedBox(height: 30,),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty || value == null){
                      return 'please enter your phone';
                    }
                    return null;
                  },
                  decoration:
                  InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFccc2fe),
                      hintText: "Phone",
                      hintStyle: TextStyle(color: Color(0xFF180e2b)),
                      suffixIcon:  Icon(Icons.phone,color: Color(0xFF180e2b)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFccc2fe),),
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                ),
                SizedBox(height: 100,),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                  }
                      , child: Text("SIGN UP",style: TextStyle(fontSize: 25,color: Color(0xFF281155),fontWeight: FontWeight.bold))),
                ),
                const SizedBox(height: 30,),
                const Text("Or Sign up with..",style: TextStyle(fontSize: 10,color: Colors.grey),),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image:DecorationImage(image:AssetImage("assets/images/facebook.png"),fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image:DecorationImage(image:AssetImage("assets/images/google.png"),fit: BoxFit.cover),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}