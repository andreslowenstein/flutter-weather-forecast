import 'package:flutter/material.dart';
import 'package:weather_forecast/widgets/wf_dropdown_field.dart';

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
    return Scaffold(
      backgroundColor: color.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
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
                            });
                          },
                          selectedValue: currentItem,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Mountain View',
                    style: text.titleLarge!.copyWith(color: color.onPrimary),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Mountain View',
                    style: text.labelLarge!.copyWith(color: color.onPrimary),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.wb_sunny_outlined,
                    color: color.onPrimary,
                    size: 80,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '14°',
                    style: text.displayLarge!.copyWith(color: color.onPrimary),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                            '16°',
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
                            'min',
                            style: text.bodyMedium!
                                .copyWith(color: color.onPrimary),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '18°',
                            style: text.bodyMedium!.copyWith(
                              color: color.onPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
