import 'dart:convert';

import 'package:weather_forecast/models/city.dart';
import 'package:weather_forecast/models/main.dart';
import 'package:weather_forecast/models/wind.dart';

class WeatherModelList {
  final List<WeatherModel>? weatherList;
  final City? name;

  WeatherModelList({
    required this.weatherList,
    required this.name,
  });

  factory WeatherModelList.fromJson(String j) {
    var x = json.decode(j);
    return WeatherModelList.fromMap(x);
  }

  factory WeatherModelList.fromMap(Map<String, dynamic> x) {
    return new WeatherModelList(
      weatherList: WeatherModel.mapList(x["list"]),
      name: City.fromMap(x['city']),
    );
  }
}

class WeatherModel {
  final List<Weather>? weather;
  final Main? main;
  final int? visibility;
  final Wind? wind;
  final int? date;

  WeatherModel({
    required this.weather,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.date,
  });

  factory WeatherModel.fromJson(String j) {
    var x = json.decode(j);
    return WeatherModel.fromMap(x);
  }

  factory WeatherModel.fromMap(Map<String, dynamic> x) {
    return new WeatherModel(
      weather: Weather.mapList(x["weather"]),
      main: Main.fromMap(x['main']),
      visibility: x['visibility'] as int,
      wind: Wind.fromMap(x['wind']),
      date: x['dt'] as int,
    );
  }

  static List<WeatherModel> mapList(List<dynamic>? x) {
    if (x == null) return [];

    return x
        .map((f) => WeatherModel.fromMap(f as Map<String, dynamic>))
        .toList();
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  static List<Weather> mapList(List<dynamic>? x) {
    if (x == null) return [];

    return x.map((f) => Weather.fromJson(f as Map<String, dynamic>)).toList();
  }

  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "main": this.main,
      "description": this.description,
      "icon": this.icon,
    };
  }

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}
