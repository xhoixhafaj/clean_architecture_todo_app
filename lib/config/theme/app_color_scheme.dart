// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
abstract class AppColorScheme {
  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color surface;
  final Color onSurface;
  final Color error;
  final Color onError;
  final Color background;
  final Color onBackground;
  final Iterable<ThemeExtension<dynamic>> extensions;

  const AppColorScheme({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.surface,
    required this.onSurface,
    required this.error,
    required this.onError,
    required this.background,
    required this.onBackground,
    required this.extensions,
  });

  ThemeData convertToTheme();
}

class TodoLightColorScheme implements AppColorScheme {
  @override
  Color get primary => const Color(0xFFE80A5F);

  @override
  Color get onPrimary => const Color(0xFFFFFFFF);

  @override
  Color get primaryContainer => const Color(0xFFFFFFFF);

  @override
  Color get onPrimaryContainer => const Color(0xFF000000);

  @override
  Color get surface => const Color(0xFFFFFFFF);

  @override
  Color get onSurface => const Color(0xFF414141);

  @override
  Color get background => const Color(0xFFFFFFFF);

  @override
  Color get onBackground => const Color(0xFF000000);

  @override
  Color get onError => const Color(0xFFFFFFFF);

  @override
  Color get error => const Color(0xFFF30000);

  @override
  Iterable<ThemeExtension> get extensions =>
      <ThemeExtension<CustomColorsExtension>>[
        CustomColorsExtension(
          lightGrey: const Color(0xFFE6E6E6),
          darkGrey: const Color(0xFF414141),
          primaryBoxShadowColor: const Color(0xFF000000).withOpacity(0.08),
        ),
      ];


  @override
  ThemeData convertToTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: primary,
      scaffoldBackgroundColor: Colors.white,
      extensions: extensions,
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: onBackground,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primary,
        foregroundColor: onPrimary,
      ),
      textTheme: TextTheme(
        ///Headline 1<
        displayLarge: TextStyle(
          fontWeight: FontWeight.w900,
          fontFamily: GoogleFonts.inter().fontFamily,
          fontSize: 64.sp,
          color: onBackground,
          height: 66 / 64,
        ),

        ///Headline 2
        displayMedium: TextStyle(
          fontWeight: FontWeight.w700,
          fontFamily: GoogleFonts.inter().fontFamily,
          fontSize: 40.sp,
          color: onBackground,
          height: 48 / 40,
        ),

        ///Headline 3
        displaySmall: TextStyle(
          fontWeight: FontWeight.w700,
          fontFamily: GoogleFonts.inter().fontFamily,
          fontSize: 32.sp,
          color: onBackground,
          height: 40 / 32,
        ),

        ///Headline 4
        headlineLarge: TextStyle(
          fontWeight: FontWeight.w700,
          fontFamily: GoogleFonts.inter().fontFamily,
          fontSize: 24.sp,
          color: onPrimaryContainer,
          height: 32 / 24,
        ),
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: GoogleFonts.inter().fontFamily,
          fontSize: 16.sp,
          color: onPrimaryContainer,
          height: 24 / 16,
        ),
        bodyMedium: TextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: GoogleFonts.inter().fontFamily,
          fontSize: 14.sp,
          color: onPrimaryContainer,
          height: 21 / 14,
        ),
        bodySmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: GoogleFonts.inter().fontFamily,
          fontSize: 12.sp,
          color: onPrimaryContainer,
          height: 15 / 12,
        ),
        labelLarge: TextStyle(
          fontWeight: FontWeight.w700,
          fontFamily: GoogleFonts.inter().fontFamily,
          fontSize: 16.sp,
          color: onPrimaryContainer,
          height: 24 / 16,
        ),
        labelMedium: TextStyle(
          fontWeight: FontWeight.w700,
          fontFamily: GoogleFonts.inter().fontFamily,
          fontSize: 14.sp,
          color: onPrimaryContainer,
          height: 21 / 14,
        ),
      ),
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        primary: primary,
        onPrimary: onPrimary,
        primaryContainer: primaryContainer,
        onPrimaryContainer: onPrimaryContainer,
        surface: surface,
        onSurface: onSurface,
        background: background,
        onBackground: onBackground,
        error: error,
        onError: onError,
        seedColor: primary,
      ),
    );
  }
}


class CustomColorsExtension extends ThemeExtension<CustomColorsExtension> {

  final Color lightGrey;
  final Color darkGrey;
  final Color primaryBoxShadowColor;

  CustomColorsExtension({
    required this.lightGrey,
    required this.darkGrey,
    required this.primaryBoxShadowColor,
  });

  @override
  ThemeExtension<CustomColorsExtension> copyWith({
    Color? lightGrey,
    Color? darkGrey,
    Color? primaryBoxShadowColor,
  }) {
    return CustomColorsExtension(
      lightGrey: lightGrey ?? this.lightGrey,
      darkGrey: darkGrey ?? this.darkGrey,
      primaryBoxShadowColor:
      primaryBoxShadowColor ?? this.primaryBoxShadowColor,
    );
  }

  @override
  ThemeExtension<CustomColorsExtension> lerp(
      covariant ThemeExtension<CustomColorsExtension>? other, double t) {
    if (other is! CustomColorsExtension) {
      return this;
    }
    return CustomColorsExtension(
      lightGrey: Color.lerp(lightGrey, other.lightGrey, t)!,
      darkGrey: Color.lerp(darkGrey, other.darkGrey, t)!,
      primaryBoxShadowColor:
      Color.lerp(primaryBoxShadowColor, other.primaryBoxShadowColor, t)!,
    );
  }
}
