// startup_screen.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/screens/home.dart';


class StartupScreen extends StatefulWidget {
  const StartupScreen({Key? key}) : super(key: key);

  @override
 
  // ignore: library_private_types_in_public_api
  _StartupScreenState createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  @override
  void initState() {
    super.initState();
  
    Timer(const Duration(seconds: 4), () {
   
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: bgfbBlue,
      body: Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
           const SizedBox(height: 10,),
          const Text("Welcome",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: textWhite),),
          const SizedBox(height: 10,),
           const Text("TO DO LTST",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: textWhite),),
             const SizedBox(height: 0,),

            Image.asset('assest/images/image1.jpg',height: 400,width:400,) ,
             const SizedBox(height: 5,),
              const Text("Lording...",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: textWhite),),
              

              Container(
            padding: const EdgeInsets.only(top: 30),
            color: bgfbBlue, // Match the background color
            child: const Text(
              "Developed by AsithaSN | © 2024 All Rights Reserved",
              style: TextStyle(fontSize: 12, color: textWhite,fontWeight: FontWeight.bold),
            ),
               ),
          ],
        ),

        
      ),
    );
  }
}
