import 'package:flutter/material.dart';
import 'package:spotify_music_app/models/category.dart';
import 'package:spotify_music_app/models/music.dart';
import 'package:spotify_music_app/services/category_operations.dart';
import 'package:spotify_music_app/services/music_operations.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget createAppBar(String title) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(title),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
            ),
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget createCategory(Category category) {
    return Container(
      color: Colors.blueGrey.shade400,
      child: Row(
        children: [
          Image.network(category.imageURL),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              category.name,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> createListOfCategories() {
    List<Widget> categories = CategoriesOperations.getCategories()
        .map((Category category) => createCategory(category))
        .toList();
    return categories;
  }

  Widget createGridView() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 300,
      child: GridView.count(
        childAspectRatio: 6 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: createListOfCategories(),
      ),
    );
  }

  Widget createMusic(Music music) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: 200,
            child: Image.network(music.image, fit: BoxFit.cover),
          ),
          Text(
            music.name,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            music.desc,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget createListOfMusic(String label) {
    List<Music> musicList = MusicOperations.getMusic();
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 300,
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) => createMusic(musicList[index])),
              itemCount: musicList.length,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueGrey, Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.3],
            ),
          ),
          child: Column(
            children: [
              createAppBar("Playlist Manager"),
              SizedBox(
                height: 5,
              ),
              createGridView(),
              createListOfMusic('Made for you'),
              createListOfMusic('Recomended Playlist'),
            ],
          ),
        ),
      ),
    );
  }
}
