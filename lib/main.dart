import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wayu_test/presentation/pages/home_page.dart';
import 'injection.dart' as di;

void main() {
  di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Wayu Test",
      themeMode: ThemeMode.light,
      theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: GoogleFonts.poppins().fontFamily,
          textTheme: TextTheme()),
      home: HomePage(),
    );
  }
}
