import 'package:flutter/material.dart';

class ConditionTitle extends StatelessWidget {
  final String condition;

  const ConditionTitle({super.key, required this.condition});

  @override
  Widget build(BuildContext context) {
    return Text(
      condition,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    );
  }
}