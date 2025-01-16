import 'package:flutter/material.dart';

class CountryName extends StatelessWidget {
  final String location;

  const CountryName({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Text(
      location,
      style: TextStyle(
        color: Colors.orange,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}