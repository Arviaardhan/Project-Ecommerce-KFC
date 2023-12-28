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
const Color titleTextColor = Color(0xFF262626);
const Color foodMenuColor = Color(0xFF767676);
const Color taxTextColor = Color(0xFF383838);

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

TextStyle headerText3 = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: primaryColor,
        fontWeight: AppThemesWeight.semiBold,
        fontSize: figmaFontsize(22)));

TextStyle headerText4 = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: headerTextColor,
        fontWeight: AppThemesWeight.semiBold,
        fontSize: figmaFontsize(25)));

TextStyle recommendedText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: headerTextColor,
        fontWeight: AppThemesWeight.semiBold,
        fontSize: figmaFontsize(30)));

TextStyle detailText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: viewDetailColor,
        fontWeight: AppThemesWeight.medium,
        fontSize: figmaFontsize(14)));

TextStyle hintText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: hintTextColor,
        fontWeight: AppThemesWeight.regular,
        fontSize: figmaFontsize(20)));

TextStyle hintTextSearch = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: hintTextColor,
        fontWeight: AppThemesWeight.semiBold,
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

TextStyle titleMenu = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: titleTextColor,
        fontWeight: AppThemesWeight.semiBold,
        fontSize: figmaFontsize(18)));

TextStyle buttonText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: secondaryColor,
        fontWeight: AppThemesWeight.semiBold,
        fontSize: figmaFontsize(20)));

TextStyle namePriceMenu = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: headerTextColor,
        fontWeight: AppThemesWeight.semiBold,
        fontSize: figmaFontsize(23)));

TextStyle priceMenu = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: headerTextColor,
        fontWeight: AppThemesWeight.medium,
        fontSize: figmaFontsize(17)));

TextStyle foodMenu = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: foodMenuColor,
        fontWeight: AppThemesWeight.regular,
        height: 1.5,
        fontSize: figmaFontsize(14)));

TextStyle textIcon = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: secondaryColor,
        fontWeight: AppThemesWeight.semiBold,
        fontSize: figmaFontsize(14)));

TextStyle orderSummary = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: foodMenuColor,
        fontWeight: AppThemesWeight.regular,
        fontSize: figmaFontsize(20)));

TextStyle notAvailableText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: headerTextColor,
        fontWeight: AppThemesWeight.medium,
        fontSize: figmaFontsize(20)));

TextStyle taxText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: taxTextColor,
        fontWeight: AppThemesWeight.regular,
        fontSize: figmaFontsize(25)));

TextStyle navbarText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: primaryColor,
        fontWeight: AppThemesWeight.medium,
        fontSize: figmaFontsize(18)));

TextStyle btnBuyText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: secondaryColor,
        fontWeight: AppThemesWeight.semiBold,
        fontSize: figmaFontsize(25)));

TextStyle btnText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: secondaryColor,
        fontWeight: AppThemesWeight.semiBold,
        fontSize: figmaFontsize(20)));

TextStyle logOutText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: primaryColor,
        fontWeight: AppThemesWeight.semiBold,
        fontSize: figmaFontsize(20)));

TextStyle labelNavbarText = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontWeight: AppThemesWeight.medium,
        fontSize: figmaFontsize(15)));

// IMAGE ASSETS
String logoKFC = "assets/logo-kfc-removebg-preview.png";
String imageUser = "assets/avatar_placeholder.png";
String imageHomepage = "assets/homepage-image.png";
String delivery = "assets/delivery.png";
String takeAway = "assets/take-aways.png";
String dineIn = "assets/dine-in.png";
String driveThru = "assets/drive-thru.png";
String catering = "assets/catering.png";
String birthDay = "assets/b-day.jpeg";
String superKomplit = "assets/super-komplit.jpg";
String cornRoasted = "assets/corn-roasted.jpg";
String snackBucket = "assets/kfc-snck-bucket.png";
String doubleKimchi = "assets/double-kimchi.jpg";
String alacatre = "assets/alacatre-snack.png";
String paketCombo = "assets/combo-menu.jpg";
String paketSpesial = "assets/paket-spesial.jpg";
String iconNotAvailable = "assets/cancel-order.png";

//Image Menu Carousel Slider
String menuBaru = "assets/menu-baru.jpg";
String menuBaru1 = "assets/menu-baru.jpg";
String menuBaru2 = "assets/menu-baru.jpg";
String menuBaru3 = "assets/menu-baru.jpg";

//Image Promotion Carousel SLider
String promotion1 = "assets/promotion-1.jpg";
