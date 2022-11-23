import 'package:flutter/material.dart';
import 'package:weather_forecast/themes/wf_theme.dart';
import 'package:weather_forecast/views/home/bloc/home_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather forecast',
      debugShowCheckedModeBanner: false,
      theme: wfTheme,
      home: HomeWeather(),
    );
  }
}
