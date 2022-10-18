import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotelsoftware/core/models/zimmer.dart';
import 'package:hotelsoftware/core/states/zimmer_state.dart';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ZimmerProvider extends StateNotifier<ZimmerState> {
  ZimmerProvider(super.state);

  updateZimmerFromDb() async {
    //Check if already is loading and set it true if it is
    if (state.isLoading == true) {
      return;
    }
    state = state.copyWith(isLoading: true);

    // fetch data from db and check if its succeed
    var url = Uri.http("localhost", "/hotel.php");
    var response = await http.get(url);
    if (response.statusCode != 200) {
      state = state.copyWith(isLoading: false);
      return;
    }

    // transform data into objects
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

    // create new state
    state = state.copyWith(zimmerList: zimmerList, isLoading: false);
  }
}
