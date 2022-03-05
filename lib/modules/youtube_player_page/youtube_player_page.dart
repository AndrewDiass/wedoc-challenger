import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePlayerPage extends StatefulWidget {
  final String idVideo;
  YoutubePlayerPage({Key? key, required this.idVideo}) : super(key: key);

  @override
  _YoutubePlayerPageState createState() => _YoutubePlayerPageState();
}

class _YoutubePlayerPageState extends State<YoutubePlayerPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

    _controller = YoutubePlayerController(
      initialVideoId: widget.idVideo,
      params: const YoutubePlayerParams(
        showControls: true,
        loop: true,
        privacyEnhanced: true,
        useHybridComposition: true,
      ),
    );
    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
      ]);
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();
    return YoutubePlayerControllerProvider(
      // Passing controller to widgets below.
      controller: _controller,
      child: Scaffold(
          body: YoutubePlayerControllerProvider(
        // Provides controller to all the widget below it.
        controller: _controller,
        child: YoutubePlayerIFrame(
          aspectRatio: 16 / 9,
        ),
      )),
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    _controller.close();
    super.dispose();
  }
}
