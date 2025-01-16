import 'package:flutter/material.dart';
import 'package:space_scutum_todo/ui/widgets/weather/models/models.dart';

class WindBoard extends StatelessWidget {
  final Wind wind;

  const WindBoard({super.key, required this.wind});

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
        Text('Wind', style: titleStyle),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text('Speed:', style: style),
                Text('${wind.speed} m/sec', style: style),
              ],
            ),
            Column(
              children: [
                Text('Direction:', style: style),
                Text('${wind.direction} º', style: style),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
