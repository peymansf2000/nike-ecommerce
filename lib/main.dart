import 'package:flutter/material.dart';
import 'package:nike_store/theme.dart';
import 'package:nike_store/ui/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle defaulTextStyle = TextStyle(
        fontFamily: 'IranYekan', color: LightThemeColors.primaryTextColor);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: defaulTextStyle.copyWith(fontWeight: FontWeight.bold),
          titleMedium: defaulTextStyle.apply(
            color: LightThemeColors.secondaryTextColor,
          ),
          bodyMedium: defaulTextStyle,
          bodySmall:
              defaulTextStyle.apply(color: LightThemeColors.secondaryTextColor),
          labelLarge: defaulTextStyle,
        ),
        colorScheme: const ColorScheme.light(
            primary: LightThemeColors.primaryColor,
            secondary: LightThemeColors.secondaryColor,
            onSecondary: Colors.white),
        useMaterial3: true,
      ),
      home: const Directionality(
          textDirection: TextDirection.rtl, child: HomeScreen()),
    );
  }
}
