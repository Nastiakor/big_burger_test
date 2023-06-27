import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appThemeData = ThemeData(
  primarySwatch: Colors.amber,
  scaffoldBackgroundColor: Color(0xFF000000),
  appBarTheme: AppBarTheme(
    color: Color(0xFF000000),
    titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    iconTheme: IconThemeData(color: Colors.white),
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
      fontSize: 15,
    ),
    labelMedium: GoogleFonts.poppins(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 15,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.amber,
      textStyle: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
);
