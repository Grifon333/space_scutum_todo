import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LastUpdateTime extends StatelessWidget {
  final DateTime lastUpdate;
  const LastUpdateTime({super.key, required this.lastUpdate});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Last update: ${DateFormat.Hm().add_yMMMd().format(lastUpdate)}',
      style: TextStyle(color: Colors.white),
    );
  }
}
