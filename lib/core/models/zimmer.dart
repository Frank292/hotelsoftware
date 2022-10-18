import 'package:hotelsoftware/core/models/abstract_entity.dart';

class Zimmer extends Entity {
  final int id;
  final String zimmerNummer;
  final int bettenId;
  final String status;
  const Zimmer({
    required this.id,
    required this.bettenId,
    required this.status,
    required this.zimmerNummer,
  });

  @override
  String toString() => '\n id: $id, Zimmernummer: $zimmerNummer, bettenid: $bettenId, status: $status \n';

  @override
  Map<String, dynamic> toJson() => {'id': id, 'zimmer_nummer': zimmerNummer, 'betten_id': bettenId, 'status': status};
  factory Zimmer.fromJson(Map<String, dynamic> json) => Zimmer(
        id: json['id'],
        bettenId: json['betten_id'],
        status: json['status'],
        zimmerNummer: json['zimmer_nummer'],
      );

  @override
  List<Object?> get props => [zimmerNummer];
}
