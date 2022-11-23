import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:weather_forecast/models/weather.dart';

class DataService {
  Future<WeatherModelList> getWeather(String city, String lang) async {
    //https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final String appid = '79bfb7061b8eac65c618600ae1135ece';

    final params = {'q': city, 'appid': appid, 'units': 'metric', 'lang': lang};

    final uri =
        Uri.https('api.openweathermap.org', '/data/2.5/forecast', params);
    try {
      final response = await http.get(uri);

      final json = jsonDecode(response.body);

      final data = WeatherModelList.fromMap(json as Map<String, dynamic>);

      return data;
    } on HttpException catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }
}
