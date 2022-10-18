import 'package:hotelsoftware/core/models/abstract_entity.dart';

class Sensor extends Entity {
  final double celsius;
  double get fahrenheit => (celsius * 9 / 5) + 32; // Formel für die umrechnung von celsius in fahrennheit
  final int humidity;

  const Sensor({double? celsius, double? fahrenheit, required this.humidity})
      : assert(celsius != null && fahrenheit != null),
        assert(celsius == null && fahrenheit == null), //We want here exact one of them
        celsius = celsius ?? (fahrenheit != null ? (fahrenheit - 32) * 5 / 9 : 0);

  Sensor copyWith({double? celsius, int? humidity}) => Sensor(
        celsius: celsius ?? this.celsius,
        humidity: humidity ?? this.humidity,
      );

  @override
  Map<String, dynamic> toJson() => {'celsius': celsius, 'humidity': humidity};
  factory Sensor.fromJson(Map<String, dynamic> json) => Sensor(
        celsius: json['celsius'],
        fahrenheit: json['fahrenheit'],
        humidity: json['humidity'],
      );

  @override
  List<Object?> get props => [celsius, fahrenheit];
}
