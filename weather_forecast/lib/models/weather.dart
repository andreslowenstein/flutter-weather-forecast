import 'dart:convert';

class WeatherModel {
  final List<Weather> weather;
  final Main main;
  final int visibility;
  final Wind wind;
  final int id;
  final String name;
  final int cod;

  WeatherModel({
    required this.weather,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherModel.fromJson(String j) {
    var x = json.decode(j);
    return WeatherModel.fromMap(x);
  }

  factory WeatherModel.fromMap(Map<String, dynamic> x) {
    return new WeatherModel(
      // weather = x['weather'] as String,
      weather: Weather.mapList(x["CUOTAS"] as List<dynamic>?),
      main: x['main'] as Main,
      visibility: x['visibility'] as int,
      wind: x['wind'] as Wind,
      id: x['id'] as int,
      name: x['name'],
      cod: x['cod'] as int,
    );
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

class Main {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;
  int seaLevel;
  int grndLevel;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });
}

class Wind {
  double speed;
  int deg;
  double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });
}
