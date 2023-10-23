import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// COLOR
const Color buttonColor = Color(0xFFE7002B);
const Color headerTextColor = Colors.black;
const Color hintTextColor = Color(0xFF8A8A8A);
const Color iconColor = Color(0xFF2D2D2D);
const Color borderColor = Color(0xFF656565);
const Color secondaryColor = Colors.white;

figmaFontsize(int fontSize) {
  return fontSize * 0.95;
}

class AppThemesSize {
  static const double headerTextSize = 30.0;
  static const double hintTextSize = 20.0;
  static const double descriptionText = 12.0;
  static const double icon = 24.0;
  static const double rectangleWidth = 319.0;
  static const double rectangleHeight = 55.0;
}

class AppThemesWeight {
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.bold;
}

//FONT STYLES
TextStyle logoText = GoogleFonts.satisfy(
    textStyle: TextStyle(
          color: headerTextColor,
          fontWeight: FontWeight.w300,
        fontSize: figmaFontsize(30)));

TextStyle headerText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: headerTextColor,
        fontWeight: FontWeight.w600,
        fontSize: figmaFontsize(35)));

TextStyle hintText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: hintTextColor,
        fontWeight: FontWeight.w400,
        fontSize: figmaFontsize(20)));

TextStyle anotherText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: hintTextColor,
        fontWeight: FontWeight.w400,
        fontSize: figmaFontsize(12)));

TextStyle linkText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: buttonColor,
        fontWeight: FontWeight.w600,
        fontSize: figmaFontsize(18)));

TextStyle menuText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: secondaryColor,
        fontWeight: AppThemesWeight.semiBold,
        fontSize: figmaFontsize(15)));

TextStyle buttonText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: secondaryColor,
        fontWeight: FontWeight.w600,
        fontSize: figmaFontsize(20)));

// IMAGE ASSETS
String logoKFC = "logo-kfc-removebg-preview.png";
String imageHomepage = "homepage-image.png";
String delivery = "delivery.jpeg";
String takeAway = "take-away.png";
String dineIn = "dine-in.jpeg";
String driveThru = "drive-thru.jpeg";
String catering = "catering.jpeg";
String birthDay = "b-day.jpeg";