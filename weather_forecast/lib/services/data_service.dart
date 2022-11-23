import 'package:http/http.dart' as http;

class DataService {
  void getWeather(String city) async {
    //https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final String q = city;
    final String appid = '79bfb7061b8eac65c618600ae1135ece';

    final uri = Uri.https('api.openweathermap.org', '/data/2.5/weather');

    final response = await http.get(uri);

    print(response.body);
  }
}
