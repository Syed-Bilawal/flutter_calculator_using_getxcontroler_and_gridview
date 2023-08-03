import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_calculator/Views/display.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'THE CALCULATOR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
       
         
          iconTheme: IconThemeData(color: Colors.black),
        ),
      
      home: const DisplayScreen());
    
  }
}
