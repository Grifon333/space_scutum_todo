import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_scutum_todo/ui/widgets/weather/weather.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({super.key});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange)),
              labelText: 'City',
              labelStyle: TextStyle(color: Colors.grey),
            ),
            controller: _textController,
            style: TextStyle(color: Colors.white),
          ),
        ),
        IconButton(
          onPressed: () =>
              context.read<WeatherCubit>().fetchWeather(_textController.text),
          icon: Icon(Icons.search, color: Colors.white),
        ),
      ],
    );
  }
}
