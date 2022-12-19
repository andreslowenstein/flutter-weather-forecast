import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/models/weather.dart';
import 'package:weather_forecast/views/home/bloc/home_bloc.dart';
import 'package:weather_forecast/widgets/wf_dropdown_field.dart';
import 'package:weather_forecast/widgets/wf_flexible_form_body.dart';
import 'package:intl/intl.dart';

class HomeWeather extends StatefulWidget {
  HomeWeather({super.key, required this.tabIndex});

  final int tabIndex;

  @override
  State<HomeWeather> createState() => _HomeWeatherState();
}

class _HomeWeatherState extends State<HomeWeather> {
  String? currentItem = 'usa.png';
  final List<String> languages = [
    'usa.png',
    'spain.png',
  ];

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is GetWeatherLoaded) {
          return WeatherView(color, context, state, text);
        }
        if (state is TabChangeLoading) {
          return Scaffold(
            backgroundColor: color.primary,
            body: Center(
              child: CircularProgressIndicator(color: color.onPrimary),
            ),
          );
        }
        if (state is TabChangeLoaded) {
          return WeatherView(color, context, state, text);
        }
        return Container();
      },
    );
  }

  Scaffold WeatherView(
      ColorScheme color, BuildContext context, state, TextTheme text) {
    final WeatherModel currentWeather = state.weather.weatherList[0];
    final List<WeatherModel> weatherList = state.weather.weatherList;
    return Scaffold(
      backgroundColor: color.primary,
      body: SafeArea(
        child: WFFlexibleFormBody(
          body: Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Weather forecast',
                        style:
                            text.titleMedium!.copyWith(color: color.onPrimary),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 5,
                        child: WFDropdownField(
                          items: languages
                              .map(
                                (e) => WFDropdownItem(
                                  value: e,
                                  label: e,
                                  key: ValueKey(e),
                                ),
                              )
                              .toList(),
                          onChanged: (ctx, value) {
                            setState(() {
                              currentItem = value;
                              BlocProvider.of<HomeBloc>(context).add(
                                SwitchLanguageEvent(
                                  lang: value == 'usa.png' ? 'en' : 'es',
                                  index: widget.tabIndex,
                                ),
                              );
                            });
                          },
                          selectedValue: currentItem,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    state.weather.name.name,
                    style: text.titleLarge!.copyWith(color: color.onPrimary),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    currentWeather.weather![0].description!,
                    style: text.titleMedium!.copyWith(color: color.onPrimary),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                      'assets/icons/${currentWeather.weather![0].icon}.png'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    currentWeather.main!.temp!.round().toString() + '°',
                    style: text.displayLarge!.copyWith(color: color.onPrimary),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'min',
                            style: text.bodyMedium!
                                .copyWith(color: color.onPrimary),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            currentWeather.main!.tempMin!.round().toString() +
                                '°',
                            style: text.bodyMedium!.copyWith(
                              color: color.onPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            'max',
                            style: text.bodyMedium!
                                .copyWith(color: color.onPrimary),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            currentWeather.main!.tempMax!.round().toString() +
                                '°',
                            style: text.bodyMedium!.copyWith(
                              color: color.onPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: color.onPrimary,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AdittionalData(color, currentWeather, text),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: color.onPrimary,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CardWeather(weatherList, text, color)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row AdittionalData(ColorScheme color, currentWeather, TextTheme text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.water_outlined,
          size: 30,
          color: color.onPrimary,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          currentWeather.main.humidity.toString(),
          style: text.bodyMedium!.copyWith(
            color: color.onPrimary,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '|',
          style: text.bodyMedium!.copyWith(
            color: color.onPrimary,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.air_outlined,
          size: 30,
          color: color.onPrimary,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          currentWeather.wind.speed.toString() + ' km/h',
          style: text.bodyMedium!.copyWith(
            color: color.onPrimary,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '|',
          style: text.bodyMedium!.copyWith(
            color: color.onPrimary,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.compress_outlined,
          size: 30,
          color: color.onPrimary,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          currentWeather.main.pressure.toString() + ' hPa',
          style: text.bodyMedium!.copyWith(
            color: color.onPrimary,
          ),
        ),
      ],
    );
  }

  Card CardWeather(
      List<WeatherModel> weatherList, TextTheme text, ColorScheme color) {
    return Card(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: weatherList.map((e) {
                DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(
                  e.date! * 1000,
                );
                String date = DateFormat("dd/MM").format(tsdate);
                String hour = DateFormat("hh:mm a").format(tsdate);

                return Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          date,
                          style:
                              text.labelLarge!.copyWith(color: color.onPrimary),
                        ),
                        Text(
                          hour,
                          style:
                              text.labelSmall!.copyWith(color: color.onPrimary),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Image.asset(
                          'assets/icons/${e.weather![0].icon}.png',
                          height: 30,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          e.main!.temp.toString() + '°',
                          style:
                              text.labelLarge!.copyWith(color: color.onPrimary),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
