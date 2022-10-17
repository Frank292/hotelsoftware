import 'package:hotelsoftware/models/zimmer.dart';

class ZimmerState {
  List<Zimmer> zimmer;

  ZimmerState({List<Zimmer>? zimmerList}) : zimmer = zimmerList ?? [];

  @override
  String toString() {
    return zimmer.toString();
  }

  ZimmerState copyWith({List<Zimmer>? zimmerList}) => ZimmerState(zimmerList: zimmerList ?? zimmer);
}
