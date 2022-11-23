class City {
  final String name;

  City({
    required this.name,
  });

  factory City.fromMap(Map<String, dynamic> x) {
    return new City(
      name: x['name'],
    );
  }
}