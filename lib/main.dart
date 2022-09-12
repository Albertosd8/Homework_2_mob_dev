import 'package:flutter/material.dart';
import 'package:hw_2_mob_dev/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green
        )
      ),
      home: HomePage(),
    );
  }
}