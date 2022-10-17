import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotelsoftware/models/zimmer.dart';
import 'package:hotelsoftware/states/zimmer_state.dart';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ZimmerProvider extends StateNotifier<ZimmerState> {
  ZimmerProvider(super.state);

  getZimmerFromDb() async {
    var url = Uri.http("localhost", "/hotel.php");
    var response = await http.get(url);
    final list = jsonDecode(response.body) as List;
    final zimmerList = <Zimmer>[];
    log(list.toString());
    for (final element in list) {
      final zimmer = Zimmer(
        id: int.parse(element['zimmer_id']),
        zimmerNummer: element['zimmer_nummer'],
        bettenId: int.parse(element['betten_id']),
        status: element['status'],
      );
      zimmerList.add(zimmer);
    }
    state = state.copyWith(zimmerList: zimmerList);
    //call the string data from php file
  }
}
