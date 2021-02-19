import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();

    /*
    _videoPlayerController = VideoPlayerController.network(
        "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4",
    )..initialize().then((_){
      setState(() {
          _videoPlayerController.play();
      });
    });

     */

    _videoPlayerController = VideoPlayerController.asset("videos/exemplo.mp4")
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {
          //_videoPlayerController.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),
      ),
      body: Center(
        child: _videoPlayerController.value.initialized
            ? AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController),
              )
            : Text("Pressione play"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _videoPlayerController.value.isPlaying ? _videoPlayerController.pause(): _videoPlayerController.play() ;
          });
        },
        child: _videoPlayerController.value.isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow_outlined),
      ),
    );
  }
}
