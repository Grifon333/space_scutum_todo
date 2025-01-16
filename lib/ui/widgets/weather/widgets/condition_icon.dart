import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_scutum_todo/ui/widgets/weather/weather.dart';

class ConditionIcon extends StatelessWidget {
  const ConditionIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final iconBytes =
    context.select((WeatherCubit cubit) => cubit.state.imageBytes);
    if (iconBytes.isEmpty) return const SizedBox.shrink();
    return SizedBox(
      height: 120,
      width: 200,
      child: Image.memory(base64Decode(iconBytes), fit: BoxFit.fitWidth),
    );
  }
}