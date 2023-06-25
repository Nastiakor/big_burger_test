import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:useradgents_exercise/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF000000),
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
