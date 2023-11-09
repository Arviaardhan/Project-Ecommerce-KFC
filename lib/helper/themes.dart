import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// COLOR
const Color primaryColor = Color(0xFFE7002B);
const Color headerTextColor = Colors.black;
const Color hintTextColor = Color(0xFF8A8A8A);
const Color iconColor = Color(0xFF2D2D2D);
const Color borderColor = Color(0xFF656565);
const Color secondaryColor = Colors.white;
const Color backgroundColor = Color(0xFFEBEBEB);
const Color viewDetailColor = Color(0xFF575757);

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
        fontWeight: AppThemesWeight.semiBold,
        fontSize: figmaFontsize(35)));

TextStyle headerText2 = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: headerTextColor,
        fontWeight: AppThemesWeight.semiBold,
        fontSize: figmaFontsize(25)));

TextStyle recommendedText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: primaryColor,
        fontWeight: AppThemesWeight.semiBold,
        fontSize: figmaFontsize(15)));

TextStyle detailText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: viewDetailColor,
        fontWeight: AppThemesWeight.medium,
        fontSize: figmaFontsize(9)));

TextStyle hintText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: hintTextColor,
        fontWeight: AppThemesWeight.regular,
        fontSize: figmaFontsize(20)));

TextStyle anotherText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: hintTextColor,
        fontWeight: AppThemesWeight.regular,
        fontSize: figmaFontsize(12)));

TextStyle linkText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: primaryColor,
        fontWeight: AppThemesWeight.semiBold,
        fontSize: figmaFontsize(18)));

TextStyle menuText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: headerTextColor,
        fontWeight: AppThemesWeight.semiBold,
        fontSize: figmaFontsize(15)));

TextStyle buttonText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: secondaryColor,
        fontWeight: FontWeight.w600,
        fontSize: figmaFontsize(20)));

// IMAGE ASSETS
String logoKFC = "assets/logo-kfc-removebg-preview.png";
String imageHomepage = "assets/homepage-image.png";
String delivery = "assets/delivery.jpeg";
String takeAway = "assets/take-away.png";
String dineIn = "assets/dine-in.jpeg";
String driveThru = "assets/drive-thru.jpeg";
String catering = "assets/catering.jpeg";
String birthDay = "assets/b-day.jpeg";
String superKomplit = "assets/super-komplit.jpg";
String cornRoasted = "assets/corn-roasted.jpg";
String snackBucket = "assets/kfc-snck-bucket.png";
String doubleKimchi = "assets/double-kimchi.jpg";