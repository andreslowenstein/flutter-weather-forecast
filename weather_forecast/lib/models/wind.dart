class Wind {
  double? speed;

  Wind({
    required this.speed,
  });

  factory Wind.fromMap(Map<String, dynamic> x) {
    return new Wind(
      speed: x['speed'] as double,
    );
  }
}
