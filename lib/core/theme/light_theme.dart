import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todos_app/core/utils/colors.dart';
import 'package:todos_app/core/utils/sizes.dart';

lightTheme(){

  return  
  
  
  ThemeData(
    primaryColor: AppColors.primaryColor,
    useMaterial3: false,

    // Define the default brightness and colors.
    colorScheme: ColorScheme.fromSeed(
    secondary: AppColors.primaryColor,
      seedColor: Colors.purple,
      // ···
      brightness: Brightness.light,
    ),

    // Define the default `TextTheme`. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: 72,
        fontWeight: FontWeight.bold,
      ),
      // ···
      titleLarge: GoogleFonts.oswald(
        fontSize: 30,
        fontStyle: FontStyle.italic,
      ),
      bodyMedium: GoogleFonts.merriweather(),
      displaySmall: GoogleFonts.pacifico(),
    ), 
     
     iconTheme: const IconThemeData(
      size: 24 
     )
  );
}