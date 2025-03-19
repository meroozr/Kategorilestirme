import 'package:flutter/material.dart';
import 'package:yeni_projem/screens/home_screen.dart';

void main() {
  runApp(Verilist());
}

class Verilist extends StatelessWidget {
  const Verilist({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
