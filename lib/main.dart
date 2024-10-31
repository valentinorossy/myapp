// lib/main.dart

import 'package:flutter/material.dart';
import 'home_screen.dart';  // Pastikan path ini benar

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),  // Pastikan HomeScreen ini terdefinisi
    );
  }
}
