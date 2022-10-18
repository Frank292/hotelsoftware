// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotelsoftware/GUI/screens/home/home.dart';
import 'package:hotelsoftware/GUI/screens/reservierung/reservierung.dart';
import 'package:hotelsoftware/GUI/screens/sensorik/sensorik.dart';
import 'package:hotelsoftware/GUI/widgets/hotelsoftware_app.dart';

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
        ref.read(zimmerProviderRef.notifier).updateZimmerFromDb();
      }),
      routes: {
        Home.route: ((_) => Home()),
        ReservierungScreen.route: (_) => ReservierungScreen(),
        SensorikScreen.path: (_) => SensorikScreen(),
      },
    ));
  }
}
