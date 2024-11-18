import 'package:elite/layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Montserrat',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyMedium: const TextStyle(
                  color: Colors.white,
                  fontVariations: [FontVariation.weight(200)])),
          textButtonTheme: const TextButtonThemeData(
              style: ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(
                    Colors.white,
                  ),
                  textStyle: WidgetStatePropertyAll(TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontVariations: [FontVariation.weight(300)]))))),
      home: const Layout(),
    );
  }
}

 