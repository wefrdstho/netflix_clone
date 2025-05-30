import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/home_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  //const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  final int _selectedBottom = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 10,
        unselectedFontSize: 10,
        onTap: (int index) {
          setState(() {
            _selectedBottom;
          });
        },
        currentIndex: _selectedBottom,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.videogame_asset_rounded),
              label: "Games",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.ondemand_video_sharp),
              label: "Coming Soon"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.file_download_outlined),
              label: "Downloads",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: "More",
          ),
        ],
      ),
      body: Stack(
        children: [
          Visibility(
              visible: _selectedBottom ==0,
              child: HomeView(),
          ),
          Visibility(
            visible: _selectedBottom ==1,
            child: Center(
              child: Text("Games View"),
            ),
          ),
          Visibility(
              visible: _selectedBottom ==2,
              child: Center(
                child: Text("Coming Soon View"),
              ),
          ),

          Visibility(
              visible: _selectedBottom == 3,
              child: Center(
                child: Text("Download View"),
              ),
          ),
          Visibility(
              visible: _selectedBottom == 4,
              child: Center(
                child: Text("More View"),
              ),
          ),
        ],
      ),
    );
  }
}