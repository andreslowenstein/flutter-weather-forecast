class Main {
  num? temp;
  num? feelsLike;
  num? tempMin;
  num? tempMax;
  int? pressure;
  int? humidity;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory Main.fromMap(Map<String, dynamic> x) {
    return new Main(
      temp: x['temp'] as num,
      feelsLike: x['feels_like'] as num,
      tempMin: x['temp_min'] as num,
      tempMax: x['temp_max'] as num,
      pressure: x['pressure'] as int,
      humidity: x['humidity'] as int,
    );
  }
}
