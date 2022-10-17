class Zimmer {
  int id;
  String zimmerNummer;
  int bettenId;
  String status;
  Zimmer({required this.id, required this.bettenId, required this.status, required this.zimmerNummer});

  @override
  String toString() => '\n id: $id, Zimmernummer: $zimmerNummer, bettenid: $bettenId, status: $status \n';
}
