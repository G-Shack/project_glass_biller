import 'package:flutter/material.dart';
import 'package:glass_biller/unit_count.dart';
import 'start_page.dart';

void main() {
  runApp(const Biller());
}

class Biller extends StatelessWidget {
  const Biller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData.dark();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        scaffoldBackgroundColor: Color(0xFF090d23),
        appBarTheme: AppBarTheme(
          color: Color(0xFF090d23),
        ),
        colorScheme: theme.colorScheme.copyWith(
          primary: Color(0xFF090d23),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => StartPage(),
        '/UnitCount': (context) => DimensionsPage(),
      },
    );
  }
}
