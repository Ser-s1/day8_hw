import 'package:day8_hw/screens/characters_screen.dart';
import 'package:day8_hw/service/api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());

}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CharactersScreen()
    );
  }
}
