import 'package:flutter/material.dart';
import 'package:spotify_music_app/screens/home.dart';
import 'package:spotify_music_app/screens/search.dart';
import 'package:spotify_music_app/screens/yourlibrary.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final tabs = [Home(), Search(), YourLibrary()];
  int currentTabIndex = 0;

  Widget miniplayer() {
    Size deviceSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      color: Colors.blueGrey,
      width: deviceSize.width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTApy5obVQ3A3ioA6OCEP0tM2bFD7Y7l6zajbhgMqktuUoUaMWIlBlD_aWKCrmPVNC8h-I&usqp=CAU",
            fit: BoxFit.cover,
          ),
          Text("Song A"),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  // UI design code goes inside build
  @override
  Widget build(BuildContext context) {
    //
    print("Appel de la methode build() du widget MyApp");
    //
    return Scaffold(
      body: tabs[currentTabIndex],
      backgroundColor: Colors.black,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          miniplayer(),
          BottomNavigationBar(
            currentIndex: currentTabIndex,
            onTap: (currentIndex) {
              //
              print("Current index is $currentIndex");
              //
              currentTabIndex = currentIndex;
              setState(() {});
            },
            backgroundColor: Colors.black45,
            selectedFontSize: 32,
            selectedItemColor: Colors.white70,
            unselectedFontSize: 16,
            unselectedItemColor: Colors.white30,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.white),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.white),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_books, color: Colors.white),
                label: 'Your library',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
