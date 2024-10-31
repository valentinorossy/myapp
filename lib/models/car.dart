class Car {
  final String make;
  final String model;
  final int year;

  Car({
    required this.make,
    required this.model,
    required this.year,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      make: json['make_display'],
      model: json['model_name'],
      year: int.parse(json['model_year']),
    );
  }
}
