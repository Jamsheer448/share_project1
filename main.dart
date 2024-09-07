import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:share_pro/image.dart';
import 'package:share_pro/text.dart';
import 'package:share_pro/video.dart';





void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
        themeMode: ThemeMode.light,
     darkTheme: ThemeData.dark(),
      //themeMode: ThemeMode.system,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  final List<Widget> _pages = [
    TextPage(),
    ImagePage(), 
    VideoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: _pages[currentPage],
        bottomNavigationBar: MoltenBottomNavigationBar(
          domeCircleColor: Colors.black,
        //          
          
          selectedIndex: currentPage,
          onTabChange: (int index) {
            setState(() {
              currentPage = index;
            });
          },
      
          tabs: [
             MoltenTab(icon:Icon(Icons.text_fields)),
             MoltenTab(icon:Icon(Icons.image)),
             MoltenTab(icon:Icon(Icons.video_collection)),
          ],
        ),
      ),
    );
  }
}
