import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

import 'audio_player_widget.dart';

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
  final String urlToStreamVideo =
      'https://lms2-ipmac-backend-staging.dft.vn/api/Upload/GetStream?path=Upload/Course/Video/20220505_032032_big_buck_bunny_720p_1mb.mp4';

  // final String urlToStreamVideo = Uri.parse(
  //         'https://lms2-ipmac-backend-staging.dft.vn/api/Upload/GetStream?path=Upload/Course/Video/20220509_020950_y2mate.com - VietsubLyrics Like My Father  Jax_1080p.mp4')
  //     .toString();

  VlcPlayerController? _videoPlayerController;

  bool isPlaying = false;

  @override
  void initState() {
    print('initState');
    super.initState();
    if (_videoPlayerController != null) {
      _videoPlayerController!.dispose();
    }
    _videoPlayerController = VlcPlayerController.network(
      urlToStreamVideo,
      hwAcc: HwAcc.full,
      autoPlay: false,
      options: VlcPlayerOptions(
        http: VlcHttpOptions([VlcHttpOptions.httpReconnect(true)]),
      ),
    );
    setState(() {
      isPlaying = _videoPlayerController!.value.isPlaying;
    });
  }

  @override
  void dispose() async {
    super.dispose();
    await _videoPlayerController!.stopRendererScanning();
    await _videoPlayerController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo cam 2'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: VlcPlayer(
                key: ObjectKey(_videoPlayerController),
                controller: _videoPlayerController!,
                aspectRatio: 16 / 9,
                placeholder: Center(child: CircularProgressIndicator()),
              ),
            ),
            Row(
              children: [
                isPlaying == false
                    ? IconButton(
                        icon: Icon(
                          Icons.play_arrow_rounded,
                        ),
                        onPressed: () {
                          print('play video ${_videoPlayerController!.value}');
                          setState(() {
                            isPlaying = true;
                          });
                          if (_videoPlayerController!.value.isInitialized &&
                              _videoPlayerController!.value.playingState ==
                                  PlayingState.stopped) {
                            print('PlayingState.stopped');
                            _videoPlayerController!.seekTo(
                              const Duration(
                                hours: 0,
                                minutes: 0,
                                seconds: 0,
                                milliseconds: 0,
                              ),
                            );
                          } else {
                            _videoPlayerController!.play();
                          }
                        },
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.pause_circle_filled_rounded,
                        ),
                        onPressed: () {
                          setState(() {
                            isPlaying = false;
                          });
                          print('pause video ${_videoPlayerController!.value}');
                          _videoPlayerController!.pause();
                        },
                      ),
                Slider(
                  min: 0.0,
                  max: _videoPlayerController!.value.duration.inSeconds
                      .toDouble(),
                  value: _videoPlayerController!.value.position.inSeconds
                      .toDouble(),
                  onChanged: (value) {
                    setState(() {
                      _videoPlayerController!
                          .seekTo(Duration(seconds: value.toInt()));
                    });
                  },
                )
              ],
            ),
            // AudioPlayerWidget()
          ],
        ),
      ),
    );
  }
}
