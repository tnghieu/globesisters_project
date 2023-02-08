import 'package:flutter/material.dart';
import 'package:globesisters/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GlobeSisters',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
