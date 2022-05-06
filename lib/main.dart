import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late VlcPlayerController _videoPlayerController;

  Future<void> initializePlayer() async {}

  @override
  void initState() {
    super.initState();

    // _videoPlayerController = VlcPlayerController.network(
    //   'https://media.w3.org/2010/05/sintel/trailer.mp4',
    //   hwAcc: HwAcc.full,
    //   autoPlay: false,
    //   options: VlcPlayerOptions(),
    // );
  }

  @override
  void didChangeDependencies() {
    _videoPlayerController = VlcPlayerController.network(
      'https://lms2-ipmac-backend-staging.dft.vn/api/Upload/GetStream?path=Upload/Course/Video/20220505_032032_big_buck_bunny_720p_1mb.mp4',
      hwAcc: HwAcc.full,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() async {
    super.dispose();
    await _videoPlayerController.stopRendererScanning();
    await _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Demo cam'),
        ),
        body: Center(
          child: VlcPlayer(
            controller: _videoPlayerController,
            aspectRatio: 16 / 9,
            placeholder: Center(child: CircularProgressIndicator()),
          ),
        ));
  }
}
