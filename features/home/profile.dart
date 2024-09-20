import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/shared.dart';

class Profile extends StatefulWidget{
   Profile({super.key});


  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //String name = Shared.getData(key: 'username');
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
          child: Column(
            children: [
              Text("Welcome",),
            ],
          ),

      ),
    );
  }
}