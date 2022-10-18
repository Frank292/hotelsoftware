import 'package:hotelsoftware/core/models/sensor.dart';
import 'package:hotelsoftware/core/states/abstract_state.dart';

class SensorState extends State {
  @override
  bool isLoading;
  Sensor sensor;

  SensorState({this.isLoading = false, required this.sensor});

  @override
  SensorState copyWith({bool? isLoading, Sensor? sensor}) => SensorState(
        isLoading: isLoading ?? this.isLoading,
        sensor: sensor ?? this.sensor,
      );
}
