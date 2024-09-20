import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localdata_app/constant.dart';
import 'package:localdata_app/features/home/home_page.dart';
import 'package:localdata_app/features/home/profile.dart';
import 'package:localdata_app/features/login_sginup/signUp_page.dart';
import '../../core/shared.dart';



class LoginPage extends StatefulWidget{
  const LoginPage({super.key});



  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKeyL = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF180e2b),
      body: Form(
        key: formKeyL,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Text("TO DO" ,style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold)),
              SizedBox(height: 25,),
              Text("Login to your account" ,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
              SizedBox(height: 100,),
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
                      suffixIcon: obscureText? Icon(Icons.remove_red_eye,color: Color(0xFF180e2b))
                          :Icon(Icons.remove_red_eye_outlined,color: Color(0xFF180e2b)),
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
                SizedBox(height: 100,),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {
                    if (formKeyL.currentState!.validate()) {
                      setState(() {
                          Shared.setData(key: 'username', value: nameController);
                          Shared.setData(key: 'password', value: passwordController);
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => HomePage()));
                      });}},
                     child: Text("LOGIN",style: TextStyle(fontSize: 25,color: Color(0xFF281155),fontWeight: FontWeight.bold))),),
                const SizedBox(height: 30,),
                const Text("Or Login with..",style: TextStyle(fontSize: 10,color: Colors.grey),),
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
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?",style: TextStyle(fontSize: 10,color: Colors.grey),),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
                    }, child: const Text("Sign up",style: TextStyle(fontSize: 10,color: Color(0xFFccc2fe),fontWeight: FontWeight.bold)))
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}