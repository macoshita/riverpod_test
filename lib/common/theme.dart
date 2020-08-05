import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appTheme = ThemeData(
  primarySwatch: Colors.yellow,
  textTheme: TextTheme(
    headline1: GoogleFonts.corben(
      textStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: Colors.black,
      ),
    ),
  ),
);
