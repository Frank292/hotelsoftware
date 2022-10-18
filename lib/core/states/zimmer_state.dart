import 'package:hotelsoftware/core/models/zimmer.dart';
import 'package:hotelsoftware/core/states/abstract_state.dart';

class ZimmerState extends State {
  @override
  bool isLoading;
  List<Zimmer> zimmer;

  ZimmerState({List<Zimmer>? zimmerList, this.isLoading = false}) : zimmer = zimmerList ?? [];

  @override
  String toString() {
    return zimmer.toString();
  }

  @override
  ZimmerState copyWith({List<Zimmer>? zimmerList, bool? isLoading}) => ZimmerState(
        zimmerList: zimmerList ?? zimmer,
        isLoading: isLoading ?? this.isLoading,
      );
}
