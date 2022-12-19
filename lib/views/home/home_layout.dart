import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/views/home/bloc/home_bloc.dart';
import 'package:weather_forecast/views/home/home_weather.dart';
import 'package:weather_forecast/widgets/wf_navbar.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  static List<Widget> _widgetOptions = <Widget>[
    HomeWeather(tabIndex: 0),
    HomeWeather(tabIndex: 1),
    HomeWeather(tabIndex: 2),
  ];

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      BlocProvider.of<HomeBloc>(context)
          .add(GetWeatherEvent(city: 'london', lang: 'en'));
    });
  }

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      BlocProvider.of<HomeBloc>(context).add(TabChangedEvent(index));
    }

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: HomeLayout._widgetOptions.elementAt(state.currentTabIndex ?? 0),
          bottomNavigationBar: WFNavBar(
            selectedIndex: state.currentTabIndex ?? 0,
            onItemTapped: _onItemTapped,
          ),
        );
      },
    );
  }
}
