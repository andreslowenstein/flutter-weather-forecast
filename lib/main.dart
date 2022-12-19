import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/themes/wf_theme.dart';
import 'package:weather_forecast/views/home/bloc/home_bloc.dart';

import 'package:weather_forecast/views/home/home_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: MaterialApp(
        title: 'Weather forecast',
        debugShowCheckedModeBanner: false,
        theme: wfTheme,
        home: HomeLayout(),
      ),
    );
  }
}
