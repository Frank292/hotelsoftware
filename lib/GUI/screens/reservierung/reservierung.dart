import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotelsoftware/core/provider/zimmer_provider.dart';
import 'package:hotelsoftware/core/states/zimmer_state.dart';

var zimmerProviderRef = StateNotifierProvider<ZimmerProvider, ZimmerState>((ref) => ZimmerProvider(ZimmerState()));

class ReservierungScreen extends HookConsumerWidget {
  static const String route = '/reservierung';
  const ReservierungScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final zimmerList = ref.watch(zimmerProviderRef).zimmer;

    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2 < 600 ? 600 : MediaQuery.of(context).size.width / 2,
        child: Column(
          children: [
            for (final zimmer in zimmerList)
              Container(
                margin: const EdgeInsets.all(6),
                padding: const EdgeInsets.all(6),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  margin: const EdgeInsets.all(6),
                  color: Colors.grey,
                  height: 80,
                  child: Column(
                    children: [
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Zimmer Nr.: ${zimmer.zimmerNummer}'),
                            Text(zimmer.id.toString()),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [Text(lol[zimmer.bettenId] ?? 'Unbekannt'), Text(zimmer.status)],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

Map<int, String> lol = {1: 'Einzelbetten', 2: 'Zwei Einzelbetten', 3: 'Doppelbett'};
