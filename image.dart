import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ImagePage extends StatelessWidget {
   void _onShare(BuildContext context) async { 
    final box = context.findRenderObject() as RenderBox?; 
    await Share.share("This is the Text Page Link :https://pin.it/5OvY3o3KB", 
        subject: "Subject", 
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size); 
  } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Page",style:  TextStyle(fontWeight: FontWeight.w700),),
         
        backgroundColor: Colors.white,
                actions: [
          IconButton(onPressed: () async {
_onShare(context);


          }, icon: Icon(Icons.ios_share_rounded))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("This is the Image Page"),
         //   Image.asset("assets/images/imagetest.png",height: 300,width: 300,)
         GestureDetector(
           onTap: () async {
                          final Uri url = Uri.parse('https://pin.it/5OvY3o3KB');
              if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                throw Exception('Could not launch $url');
              }
            },
        
          
          
          child: Image.network("https://i.pinimg.com/564x/64/8a/0e/648a0e8336350a296d2766123b7c4e39.jpg",height: 300,width: 300,))
          ],
        ),

      ),
    );
  }
}
