import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/views/home/bloc/home_bloc.dart';
import 'package:weather_forecast/widgets/wf_dropdown_field.dart';
import 'package:weather_forecast/widgets/wf_flexible_form_body.dart';

class HomeWeather extends StatefulWidget {
  HomeWeather({super.key});

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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                                    index: 0),
                              );
                            });
                          },
                          selectedValue: currentItem,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    state.weather.name,
                    style: text.titleLarge!.copyWith(color: color.onPrimary),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    state.weather.weather[0].description,
                    style: text.titleMedium!.copyWith(color: color.onPrimary),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                      'assets/icons/${state.weather.weather[0].icon}.png'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    state.weather.main.temp.toString() + '°',
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
                            state.weather.main.tempMin.toString() + '°',
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
                            state.weather.main.tempMax.toString() + '°',
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
                  Row(
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
                        state.weather.main.humidity.toString(),
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
                        state.weather.wind.speed.toString() + ' km/h',
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
                        state.weather.main.pressure.toString() + ' hPa',
                        style: text.bodyMedium!.copyWith(
                          color: color.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          footer: Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Image.asset(
              'assets/480_Color_gris.png',
              height: 60,
            ),
          ),
        ),
      ),
    );
  }
}
