import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todos_app/core/utils/colors.dart';

darkTheme(){

  return  
  Platform.isAndroid? 
  
  
  ThemeData(
    useMaterial3: true,
primaryColor: AppColors.primaryColor,
    // Define the default brightness and colors.
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple,
      // ···
      brightness: Brightness.dark,
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
    )
  )
  :

  CupertinoThemeData(
    // useMaterial3: true,
// primaryColor: AppColors.primaryColor,
//     // Define the default brightness and colors.
//     colorScheme: ColorScheme.fromSeed(
//       seedColor: Colors.purple,
//       // ···
//       brightness: Brightness.dark,
//     ),

    // Define the default `TextTheme`. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: CupertinoTextThemeData(
      navLargeTitleTextStyle: const TextStyle(
        fontSize: 72,
        fontWeight: FontWeight.bold,
      ),
      // ···
      navTitleTextStyle: GoogleFonts.oswald(
        fontSize: 30,
        fontStyle: FontStyle.italic,
      ),
     
    )
  )
  
  
  
  
  
  ;



}