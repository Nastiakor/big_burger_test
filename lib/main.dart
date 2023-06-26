import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:useradgents_exercise/presentation/pages/home_page.dart';
import 'package:useradgents_exercise/providers/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<CartProvider>(
      create: (context) => CartProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF000000),
        appBarTheme: AppBarTheme(
          color: Color(0xFF000000),
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
          ),
          bodyLarge: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          bodySmall: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
