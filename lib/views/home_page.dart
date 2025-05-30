import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/widget/special_movie.dart';
import 'package:flutter_application_1/widget/movie_card.dart';
import 'package:flutter_application_1/widget/top_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _showTobBar = true;
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.addListener(() {
      final isScrollingUp = controller.position.userScrollDirection == ScrollDirection.forward;
      if (_showTobBar != isScrollingUp) {
        setState(() {
          _showTobBar = isScrollingUp;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: controller,
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SpecialMovie(
                    image: "assets/movies/wednesday.jpg",
                    key: Key("special-movie"),
                  ),
                  SizedBox(height: 10),
                  loadPopularOnNetflix(),
                  SizedBox(height: 10),
                  loadTrendingNow(),
                  SizedBox(height: 10),
                  loadNewReleases(),
                  SizedBox(height: 10),
                ],
              ),
            ),
            AnimatedPositioned(
              top: _showTobBar ? 0 : -80,
              duration: Duration(milliseconds: 300),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 300),
                opacity: _showTobBar ? 1 : 0,
                child: IgnorePointer(
                  ignoring: !_showTobBar,
                  child: TopBar(key: Key("top-bar")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget loadPopularOnNetflix() {
    return buildMovieSection("Popular on Netflix", [
      "myoctopusteacher.jpg",
      "bettercallsaul.jpg",
      "number.jpg",
      "blackmirror.jpg",
      "thecrown.jpg",
      "annewithane.jpg",
    ]);
  }

  Widget loadTrendingNow() {
    return buildMovieSection("Trending Now", [
      "wednesday.jpg",
      "emilyinparis.jpg",
      "theshining.jpg",
      "theplatform.jpg",
      "number.jpg",
      "pulpfiction.jpg",
    ]);
  }

  Widget loadNewReleases() {
    return buildMovieSection("New Releases", [
      "joker.jpg",
      "azizler.jpg",
      "deathnote.jpg",
      "lotr.jpg",
      "harrypotter.jpg",
      "breakingbad.jpg",
    ]);
  }

  Widget buildMovieSection(String title, List<String> imageFiles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 10),
          physics: BouncingScrollPhysics(),
          child: Row(
            children: imageFiles.map((fileName) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: MovieCard(
                  image: AssetImage("assets/movies/$fileName"),
                  key: Key("movie-card-${fileName.split('.').first}"),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
