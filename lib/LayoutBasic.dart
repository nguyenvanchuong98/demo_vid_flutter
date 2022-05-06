// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:myfirstapp/transaction.dart';

class LayoutBasic extends StatefulWidget {
  LayoutBasic({Key? key}) : super(key: key);

  @override
  State<LayoutBasic> createState() => _LayoutBasicState();
}

class _LayoutBasicState extends State<LayoutBasic> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _contentController = new TextEditingController();
  final _amoutController = new TextEditingController();
  Transaction _transaction = Transaction(content: '', amount: 0.0);
  List<Transaction> _transactions = <Transaction>[];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Layout Basic',
        home: Scaffold(
          key: _scaffoldKey,
          body: SafeArea(
              minimum: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Content'),
                    onChanged: (text) {
                      setState(() {
                        _transaction.content = text;
                      });
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amout(money)'),
                    onChanged: (text) {
                      setState(() {
                        _transaction.amount = double.tryParse(text) ?? 0;
                      });
                    },
                  ),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 10)),
                  ButtonTheme(
                    height: 50,
                    child: FlatButton(
                      onPressed: () {
                        // print('Content= $_content,money= $_amout ');
                        setState(() {
                          _transactions.add(_transaction);
                          _transaction = Transaction(content: '', amount: 0.0);
                          _contentController.text = '';
                          _amoutController.text = '';
                        });
                        _scaffoldKey.currentState?.showSnackBar(SnackBar(
                          content: Text(
                              'transaction list: ' + _transactions.toString()),
                          duration: Duration(seconds: 3),
                        ));
                      },
                      child: Text(
                        'Insert Transaction',
                        style: const TextStyle(fontSize: 18),
                      ),
                      color: Colors.pinkAccent,
                      textColor: Colors.white,
                    ),
                  ),
                  Column(
                    children: _transactions.map((e) {
                      return ListTile(
                        leading: const Icon(Icons.access_alarm),
                        title: Text(e.content),
                        subtitle: Text(e.amount.toString()),
                        onTap: () {
                          print('Tap me');
                        },
                      );
                    }).toList(),
                  )
                ],
              )),
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._transactions = [];
    print('init transac---------------------');
  }
}
