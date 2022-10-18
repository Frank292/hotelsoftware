// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hotelsoftware/widget.dart';

class Home extends StatelessWidget {
  static const String route = '/';
  final title = 'Home';

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.blue[400],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.all(6),
                    padding: const EdgeInsets.all(6),
                    color: Colors.black,
                    child: Container(
                      color: Colors.white,
                      child: InkWell(
                        onTap: (() {}),
                        child: const Icon(
                          Icons.sensors_sharp,
                          size: 100,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
