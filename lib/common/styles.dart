import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

late String font = 'Montserrat';

const w100 = FontWeight.w100;
const w200 = FontWeight.w200;
const w300 = FontWeight.w300;
const w400 = FontWeight.w400;
const w500 = FontWeight.w500;
const w600 = FontWeight.w600;
const w700 = FontWeight.w700;
const w800 = FontWeight.w800;
const w900 = FontWeight.w900;
const baseAppColor = Color(0xFF000000);
const defaultColor = Color(0xFF000000);
const hintColor = Color(0xFF757778);
const lightGrey = Color(0xFFEBEBEB);
const whiteColor = Color(0xFFFFFFFF);
const backgroundColor = Color(0xFFFFFFFF);
const appbarColor = Color(0xFFFFFFFF);

const appPadding = 16.0;
const appBorder = 30.0;
const textFieldPaddingHorizontal = 25.0;
const avatarDefault = 'https://photo-cms-kienthuc.zadn.vn/zoom/800/uploaded/nguyenanhson/2021_06_03/4/dep-tua-tinh-dau-hot-girl-nga-lam-netizen-tan-chay-la-ai.jpeg';
//           AppBar Style           //
var appbarStyle = GoogleFonts.getFont(
  font,
  textStyle: const  TextStyle(
    color: defaultColor,
    fontSize: 18,
    fontWeight: w700,
  ),
);
var alertStyle = GoogleFonts.getFont(
  font,
  textStyle: const  TextStyle(
    color: baseAppColor,
    fontSize: 14,
    fontWeight: w500,
  ),
);
var hintText = GoogleFonts.getFont(
  font,
  textStyle: const  TextStyle(
    color: Colors.black26,
    fontSize: 14,
    fontWeight: w500,
  ),
);
var buttonStyle = GoogleFonts.getFont(
  font,
  textStyle: const  TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: w500,
  ),
);
var errText = GoogleFonts.getFont(
  font,
  textStyle: const  TextStyle(
    color: Colors.red,
    fontSize: 12,
    fontWeight: w500,
  ),
);
var underline = GoogleFonts.getFont(
  font,
  textStyle: const  TextStyle(
    color: Colors.blueAccent,
    fontSize: 14,
    fontWeight: w500,
    decoration: TextDecoration.underline,
  ),
);
//           DefaultColor Text           //
var size11W500Default = GoogleFonts.getFont(
  font,
  textStyle: const TextStyle(
    color: defaultColor,
    fontSize: 11,
    fontWeight: w500,
  ),
);
var size12W500Default = GoogleFonts.getFont(
  font,
  textStyle: const TextStyle(
    color: defaultColor,
    fontSize: 12,
    fontWeight: w500,
  ),
);
var size14W500Default = GoogleFonts.getFont(
  font,
  textStyle: const TextStyle(
    color: defaultColor,
    fontSize: 14,
    fontWeight: w500,
  ),
);
var size16W500Default = GoogleFonts.getFont(
  font,
  textStyle: const TextStyle(
    color: defaultColor,
    fontSize: 16,
    fontWeight: w500,
  ),
);
var size16W700Default = GoogleFonts.getFont(
  font,
  textStyle: const TextStyle(
    color: defaultColor,
    fontSize: 16,
    fontWeight: w700,
  ),
);
//           WhiteColor Text           //
var size11W500White = GoogleFonts.getFont(
  font,
  textStyle: const TextStyle(
    color: whiteColor,
    fontSize: 11,
    fontWeight: w500,
  ),
);
var size12W500White = GoogleFonts.getFont(
  font,
  textStyle: const TextStyle(
    color: whiteColor,
    fontSize: 12,
    fontWeight: w500,
  ),
);
var size14W500White = GoogleFonts.getFont(
  font,
  textStyle: const TextStyle(
    color: whiteColor,
    fontSize: 14,
    fontWeight: w500,
  ),
);
//           Hint Text           //
var size12W400Hint = GoogleFonts.getFont(
  font,
  textStyle: const TextStyle(
    color: hintColor,
    fontSize: 12,
    fontWeight: w400,
  ),
);
var size11W500Hint = GoogleFonts.getFont(
  font,
  textStyle: const TextStyle(
    color: hintColor,
    fontSize: 12,
    fontWeight: w500,
  ),
);
var size10W400Hint = GoogleFonts.getFont(
  font,
  textStyle: const TextStyle(
    color: hintColor,
    fontSize: 10,
    fontWeight: w400,
  ),
);