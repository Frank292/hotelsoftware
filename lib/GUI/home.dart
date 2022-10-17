// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../widget.dart';

class Home extends StatelessWidget {
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
                    margin: EdgeInsets.all(6),
                    padding: EdgeInsets.all(6),
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
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2 < 600 ? 600 : MediaQuery.of(context).size.width / 2,
                child: MyWidget(),
              ),
            ),
          ],
        ));
  }
}
