import 'dart:ffi';

import 'package:flutter/material.dart';

class LayoutBasic extends StatefulWidget {
  LayoutBasic({Key? key}) : super(key: key);

  @override
  State<LayoutBasic> createState() => _LayoutBasicState();
}

class _LayoutBasicState extends State<LayoutBasic> {
  final _contentController = new TextEditingController();
  final _amoutController = new TextEditingController();
  final Double _amout;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Layout Basic',
        home: Scaffold(
          body: SafeArea(
              minimum: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Content'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amout(money)'),
                  ),
                  FlatButton(onPressed: onPressed, child: child)
                ],
              )),
        ));
  }
}
