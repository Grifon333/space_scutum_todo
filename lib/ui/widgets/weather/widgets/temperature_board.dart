import 'package:flutter/material.dart';
import 'package:space_scutum_todo/ui/widgets/weather/models/models.dart';

class TemperatureBoard extends StatelessWidget {
  final Temperature temperature;

  const TemperatureBoard({super.key, required this.temperature});

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(
      color: Colors.orange,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
    final style = TextStyle(
      color: Colors.white,
    );
    return Column(
      children: [
        Text('Temperature (ºC)', style: titleStyle),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text('Current:', style: style),
                Text('${temperature.current}', style: style),
              ],
            ),
            Column(
              children: [
                Text('Min:', style: style),
                Text('${temperature.min}', style: style),
              ],
            ),
            Column(
              children: [
                Text('Max:', style: style),
                Text('${temperature.max}', style: style),
              ],
            ),
          ],
        ),
      ],
    );
  }
}