import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotelsoftware/widget.dart';

void main() {
  runApp(const MyApp());
  getDataFromSql();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: const MyWidget(),
          ),
        ),
      ),
    );
  }
}
