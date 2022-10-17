// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotelsoftware/GUI/home.dart';
import 'package:hotelsoftware/GUI/hotelsoftware_app.dart';
import 'package:hotelsoftware/widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: HotelsoftwareApp(
      title: 'Hotelsoftware',
      home: Home(),
      onInit: ((ref) {
        ref.read(stringRef.notifier).getZimmerFromDb();
      }),
    ));
  }
}
