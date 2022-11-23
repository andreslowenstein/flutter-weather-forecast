import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_forecast/models/weather.dart';

class DataService {
  Future<WeatherModel> getWeather(String city, String lang) async {
    //https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final String appid = '79bfb7061b8eac65c618600ae1135ece';

    final params = {'q': city, 'appid': appid, 'units': 'metric', 'lang': lang};

    final uri =
        Uri.https('api.openweathermap.org', '/data/2.5/weather', params);
    try {
      final response = await http.get(uri);

      final json = jsonDecode(response.body);

      final data = WeatherModel.fromMap(json);

      return data;
    } catch (e) {
      throw e;
    }
  }
}
