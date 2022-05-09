import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChewieTest extends StatefulWidget {
  const ChewieTest({Key? key}) : super(key: key);

  @override
  State<ChewieTest> createState() => _ChewieTestState();
}

class _ChewieTestState extends State<ChewieTest> {
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    // Wrapper on top of the videoPlayerController
    _chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.network(
        'https://lms2-ipmac-backend-staging.dft.vn/api/Upload/GetStream?path=Upload/Course/Video/20220505_032032_big_buck_bunny_720p_1mb.mp4',
      ),
      aspectRatio: 16 / 9,
      // Prepare the video to be played and display the first frame
      autoInitialize: true,
      looping: false,
      // Errors can occur for example when trying to play a video
      // from a non-existent URL
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChewieTest'),
      ),
      body: Container(
        color: Colors.red,
        width: MediaQuery.of(context).size.width,
        height: 300,
        child: Chewie(
          controller: _chewieController!,
        ),
      ),
    );
  }
}
