import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/views/home/bloc/home_bloc.dart';
import 'package:weather_forecast/views/home/contact_page.dart';
import 'package:weather_forecast/views/home/home_weather.dart';
import 'package:weather_forecast/widgets/wf_navbar.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  static List<Widget> _widgetOptions = <Widget>[
    // HomeWeather(city: 'London'),
    // HomeWeather(city: 'Buenos Aires'),
    // HomeWeather(city: 'New York'),
    HomeWeather(),
    HomeWeather(),
    HomeWeather(),
    ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      BlocProvider.of<HomeBloc>(context).add(TabChangedEvent(index));
    }

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: _widgetOptions.elementAt(state.currentTabIndex),
          bottomNavigationBar: WFNavBar(
            selectedIndex: state.currentTabIndex,
            onItemTapped: _onItemTapped,
          ),
        );
      },
    );
  }
}
