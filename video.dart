import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPage extends StatefulWidget {
  @override
  _YouTubeVideoScreenState createState() => _YouTubeVideoScreenState();
}

class _YouTubeVideoScreenState extends State<VideoPage> {
  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(
        "This is the Text Page Link :https://www.youtube.com/watch?v=TYX3wGsKpwI",
        subject: "Subject",
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }

  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: 'TYX3wGsKpwI',
      autoPlay: false,
      params: YoutubePlayerParams(showFullscreenButton: true),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Page",style:  TextStyle(fontWeight: FontWeight.w700),),
        
        backgroundColor: Colors.white,

        actions: [
          IconButton(
              onPressed: () async {
                _onShare(context);

              },
              icon: Icon(Icons.ios_share_rounded))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // color: Colors.grey,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(50), // Curves all sides
              ),
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: YoutubePlayer(
                keepAlive: false,
                controller: _controller,
                aspectRatio: 16 / 9,
              ),
            ),
          ),
          TextButton(
            style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black)),
              onPressed: () async {
                                final Uri url =
                    Uri.parse('https://www.youtube.com/watch?v=TYX3wGsKpwI ');
                if (!await launchUrl(url,
                    mode: LaunchMode.externalApplication)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Go to Youtube',style: TextStyle(color: Colors.white),),
                  SizedBox(width: 5,),
                  Icon(Icons.arrow_forward_rounded ,color: Colors.white,),
                ],
              ))
        ],
      ),
    );
  }
}
