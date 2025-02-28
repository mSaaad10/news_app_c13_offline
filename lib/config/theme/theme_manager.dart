import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_c13_offline/core/colors_manager.dart';

class ThemeManager {
  static final ThemeData light = ThemeData(
    primaryColor: ColorsManager.white,
  );
  static final ThemeData dark = ThemeData(
      primaryColor: ColorsManager.black,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorsManager.black,
        foregroundColor: ColorsManager.white,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.white,
        ),
        centerTitle: true,
      ),
      scaffoldBackgroundColor: ColorsManager.black,
      textTheme: TextTheme(
          titleLarge: GoogleFonts.inter(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: ColorsManager.white),
          titleMedium: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: ColorsManager.white),
          titleSmall: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: ColorsManager.grey),
          labelLarge: GoogleFonts.inter(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: ColorsManager.black),
          labelMedium: GoogleFonts.inter(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: ColorsManager.white),
          headlineMedium: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: ColorsManager.white),
          headlineSmall: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: ColorsManager.white)));
}
