import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

var stringRef = StateProvider((ref) => 'test');

class MyWidget extends HookConsumerWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(stringRef);

    return Column(
      children: [
        Text(text),
        TextButton(
          onPressed: () async {
            ref.read(stringRef.notifier).state = await getDataFromSql();
          },
          child: const Text('Load'),
        )
      ],
    );
  }
}

Future<String> getDataFromSql() async {
  var url = Uri.http("localhost", "/hotel.php");
  var response = await http.get(url);
  log(response.body);
  //call the string data from php file
  return response.body;
}
