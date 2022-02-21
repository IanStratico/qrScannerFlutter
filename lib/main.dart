import 'package:flutter/material.dart';
import 'package:qr_scanner/pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Reader',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'mapa': (_) => MapaScreen(),
      },
      theme: ThemeData(
          primaryColor: Colors.deepPurple,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.deepPurple)),
    );
  }
}
