import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotelsoftware/states/zimmer_provider.dart';
import 'package:hotelsoftware/states/zimmer_state.dart';

var stringRef = StateNotifierProvider<ZimmerProvider, ZimmerState>((ref) => ZimmerProvider(ZimmerState()));

class MyWidget extends HookConsumerWidget {
  MyWidget({Key? key}) : super(key: key) {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final zimmerList = ref.watch(stringRef).zimmer;

    return SingleChildScrollView(
      child: Column(
        children: [
          for (final zimmer in zimmerList)
            Container(
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.all(6),
              child: Container(
                padding: EdgeInsets.all(6),
                margin: EdgeInsets.all(6),
                color: Colors.grey,
                height: 80,
                child: Column(
                  children: [
                    Flexible(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Title'),
                            Text('1'),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [Text('Zimmerbetten'), Text(zimmer.status)],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

Map<int, String> lol = {1: 'Einzelbetten', 2: 'Zwei Einzelbetten', 3: 'Doppelbett'};
