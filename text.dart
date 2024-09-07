import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class TextPage extends StatelessWidget {
  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(
        "This is the Text Page Link :https://www.linkedin.com",
        subject: "Subject",
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Page",style:  TextStyle(fontWeight: FontWeight.w700),),
      
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {_onShare(context);}, icon: Icon(Icons.ios_share_rounded))
        ],
      ),
      body: Center(
        child: GestureDetector(
            onTap: () async {
              final Uri url = Uri.parse('https://www.linkedin.com');
              if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                throw Exception('Could not launch $url');
              }
            },
            child: Text(
              "linkedin.com",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            )),
      ),
    );
  }
}
