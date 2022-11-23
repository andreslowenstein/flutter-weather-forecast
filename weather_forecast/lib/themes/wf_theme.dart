// import 'package:fertil_wallet/helpers/Transitions/fade_route_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// http://mcg.mbitson.com/#!?mcgpalette0=%23f2f2f2 Color swatch generator

Map<int, Color> wfPrimarySwatch = {
  50: Color(0xffe6e6e6),
  100: Color(0xffbfbfbf),
  200: Color(0xff959595),
  300: Color(0xff6b6b6b),
  400: Color(0xff4b4b4b),
  500: Color(0xff2b2b2b),
  600: Color(0xff262626),
  700: Color(0xff202020),
  800: Color(0xff1a1a1a),
  900: Color(0xff101010),
};

Map<int, Color> wfSecondarySwatch = {
  50: Color(0xffE8FFFB),
  100: Color(0xffB9FFF3),
  200: Color(0xff8BFFEC),
  300: Color(0xff5DFFE4),
  400: Color(0xff00FFD5),
  500: Color(0xff00D1AE),
  600: Color(0xff00A287),
  700: Color(0xff04816C),
  800: Color(0xff06594C),
  900: Color(0xff093C33)
};

Map<int, Color> wfErrorSwatch = {
  50: Color(0xffFEEAE9),
  100: Color(0xffFCC1BD),
  200: Color(0xffFA9891),
  300: Color(0xffF76E64),
  400: Color(0xffF54538),
  500: Color(0xffF31B0C),
  600: Color(0xffDE190B),
  700: Color(0xffC7160A),
  800: Color(0xff9B1108),
  900: Color(0xff6E0C05)
};

Map<int, Color> wfAccentSwatch = {
  50: Color(0xffFFFBE8),
  100: Color(0xffFFF3B9),
  200: Color(0xffFFD98B),
  300: Color(0xffFFCA5D),
  400: Color(0xffFFBB2E),
  500: Color(0xffFFAC00),
  600: Color(0xffD1AE00),
  700: Color(0xffA28700),
  800: Color(0xff746000),
  900: Color(0xff463A00)
};

var wfPrimaryColor =
    MaterialColor(wfPrimarySwatch[600]!.value, wfPrimarySwatch);

var wfSecondaryColor =
    MaterialColor(wfSecondarySwatch[600]!.value, wfSecondarySwatch);

var wfTerciaryColor = MaterialColor(wfAccentSwatch[500]!.value, wfAccentSwatch);

var wfErrorColor = MaterialColor(wfErrorSwatch[600]!.value, wfErrorSwatch);

Color bodyBackground = Color(0xfff8f8f8);
Color swBlack = Color(0xff2f2f2f);

final ThemeData wfTheme = ThemeData(
  scaffoldBackgroundColor: bodyBackground,
  backgroundColor: wfPrimaryColor,
  fontFamily: "Montserrat",
  primaryColor: wfPrimaryColor,
  primarySwatch: wfPrimaryColor,
  primaryColorDark: wfPrimaryColor.shade900,
  primaryColorLight: wfPrimaryColor.shade300,
  errorColor: wfErrorColor,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primaryContainer: wfPrimaryColor,
    secondaryContainer: wfSecondaryColor,
    tertiaryContainer: wfTerciaryColor,
    errorContainer: wfErrorColor,
    onPrimaryContainer: Colors.white,
    onSecondaryContainer: Colors.white,
    onTertiaryContainer: swBlack,
    onErrorContainer: Colors.red,
    primary: wfPrimaryColor,
    onPrimary: Colors.white,
    secondary: wfSecondaryColor,
    onSecondary: Colors.white,
    tertiary: wfTerciaryColor,
    onTertiary: swBlack,
    error: Colors.red,
    onError: Colors.red,
    background: bodyBackground,
    onBackground: swBlack,
    surface: Colors.white,
    onSurface: swBlack,
  ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
    color: wfPrimaryColor,
    titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 17.0,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600),
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(height: 64 / 57, fontSize: 57),
    displayMedium: TextStyle(height: 52 / 45, fontSize: 45),
    displaySmall: TextStyle(height: 44 / 36, fontSize: 36),
    headlineLarge: TextStyle(height: 40 / 32, fontSize: 32),
    headlineMedium:
        TextStyle(height: 36 / 28, fontSize: 28, fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(height: 32 / 24, fontSize: 24),
    titleLarge: TextStyle(
      height: 28 / 22,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      height: 24 / 16,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.15,
    ),
    titleSmall: TextStyle(
        height: 20 / 14,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1),
    bodyLarge: TextStyle(height: 24 / 16, fontSize: 16, letterSpacing: 0.5),
    bodyMedium: TextStyle(height: 20 / 14, fontSize: 14, letterSpacing: 0.25),
    bodySmall: TextStyle(height: 16 / 12, fontSize: 12, letterSpacing: 0.4),
    labelLarge: TextStyle(height: 20 / 14, fontSize: 14, letterSpacing: 0.1),
    labelMedium: TextStyle(height: 16 / 12, fontSize: 12, letterSpacing: 0.5),
    labelSmall: TextStyle(height: 16 / 11, fontSize: 11, letterSpacing: 0.4),
  ),
  listTileTheme: ListTileThemeData(
    minLeadingWidth: 20,
  ),
  // pageTransitionsTheme: PageTransitionsTheme(builders: {
  //   TargetPlatform.android: FadePageTransitionBuilder(),
  //   TargetPlatform.iOS: FadePageTransitionBuilder()
  // }),
  inputDecorationTheme: InputDecorationTheme(
    alignLabelWithHint: true,
    labelStyle: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
      letterSpacing: 0.1,
    ),
    contentPadding: EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 10,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: swBlack,
      ),
      borderRadius: BorderRadius.circular(6),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: wfPrimaryColor,
      ),
      borderRadius: BorderRadius.circular(6),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: wfErrorColor,
      ),
      borderRadius: BorderRadius.circular(6),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: wfErrorColor,
      ),
      borderRadius: BorderRadius.circular(6),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(6),
    ),
  ),
  cardTheme: CardTheme(
    color: wfPrimaryColor[400],
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(6),
      ),
    ),
  ),
);
