import 'package:flutter/material.dart';
import 'home.dart';
void main() => runApp(Myapp());
class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'CSCI410 Week 5',
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}
