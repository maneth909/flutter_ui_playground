import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF5E5CE5);
    const backgroundGrey = Color(0xFFF5F7FA);
    const darkText = Color(0xFF1E1E2D);
    const greyText = Color(0xFF7D8499);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundGrey,
        colorScheme: ColorScheme.light(
          primary: primaryBlue,
          surface: Colors.white,
          onSurface: darkText,
          onSurfaceVariant: greyText,
        ),
        textTheme: GoogleFonts.plusJakartaSansTextTheme(),
      ),
      title: 'Flutter UI',
      home: HomePage(),
    );
  }
}
