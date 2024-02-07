import 'package:flutter/material.dart';
import 'package:todoapp/screens/startup.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       title: 'ToDoList',
      theme: ThemeData(
      
      ),
      home:const StartupScreen(),  
    );
  }
}

