import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  String name;
  int age;
  // ignore: use_key_in_widget_constructors
  MyApp({required this.name, required this.age});
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  String fff = 'abc@gmail.com';
  final emailEdittingController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ignore: avoid_print
    WidgetsBinding.instance?.addObserver(this);
    print('init running-----------------------');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // ignore: avoid_print
    emailEdittingController.dispose();
    WidgetsBinding.instance?.removeObserver(this);
    print('dispose running-----------------------');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeDependencies
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      print('App is in Background mode');
    } else if (state == AppLifecycleState.resumed) {
      print('Appis in Foreground mode');
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('build running-----------------------');
    return MaterialApp(
      title: "This is a StatefulWiget",
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                controller: emailEdittingController,
                onChanged: (text) {
                  setState(() {
                    // ignore: avoid_print
                    print('abce ddfskflslfk ---------------------------------' +
                        text);
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
              'Email is typed:',
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
