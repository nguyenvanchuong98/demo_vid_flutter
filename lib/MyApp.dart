import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String fff = 'abc@gmail.com';
  final emailEdittingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "This is a StatefulWiget",
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: emailEdittingController,
                onChanged: (text) {
                  setState(() {
                    fff = text;
                  });
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    labelText: 'Enter your mail'),
              ),
            ),
            const Text(
              'See result here:',
              style: TextStyle(fontSize: 30, color: Colors.blueAccent),
            ),
            Text(
              fff,
              style: const TextStyle(fontSize: 30, color: Colors.green),
            )
          ],
        )),
      ),
    );
  }
}
