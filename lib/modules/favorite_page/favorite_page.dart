import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  final int number;

  FavoritePage({required this.number}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('My number is: $number'),
      ),
    );
  }
}
