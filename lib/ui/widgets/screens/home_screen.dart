import 'package:flutter/material.dart';

import 'package:zone4/repositories/data_repository.dart';
import 'package:zone4/ui/widgets/movie_card.dart';
import 'package:zone4/ui/widgets/movie_category.dart';
import 'package:zone4/ui/widgets/movie_category_caroussel.dart';
import 'package:zone4/ui/widgets/screens/search_screen.dart';

import 'package:zone4/utils/constant.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getPopularMovies();
  }

  void getPopularMovies() async {
    final dataProvider = Provider.of<DataRepository>(context, listen: false);
    await dataProvider.getPopularMovies();
    await dataProvider.getNowPlayingMovies();
    await dataProvider.getUpcomingMovies();
    await dataProvider.getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataRepository>(context);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: Image.asset('assets/images/Z.png'),
        actions: [
          IconButton(
              onPressed: () {
                debugPrint(dataProvider.allMovieList[0].name);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SearchScreen(
                      movies: dataProvider.allMovieList,
                    );
                  },
                ));
              },
              icon: Icon(
                Icons.search,
                size: 50,
                color: kPrimaryColor1,
              )),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 500,
            color: kPrimaryColor1,
            child: dataProvider.popularMoviesList.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.black,
                  ))
                : MovieCard(movie: dataProvider.popularMoviesList.first),
          ),
          MovieCategoryCaroussel(
              callback: dataProvider.getTopRatedMovies,
              label: 'Top Rated',
              movieList: dataProvider.topRatedMoviesList),
          MovieCategory(
              callback: dataProvider.getNowPlayingMovies,
              label: 'Now Playing',
              movieList: dataProvider.nowPlayingMoviesList,
              imageHeight: 320),
          MovieCategoryCaroussel(
              callback: dataProvider.getAnimationMovies,
              label: 'Animation Movies',
              movieList: dataProvider.animationMoviesList),
          MovieCategory(
              callback: dataProvider.getUpcomingMovies,
              label: 'Upcoming',
              movieList: dataProvider.upcomingMoviesList,
              imageHeight: 200),
          MovieCategoryCaroussel(
              callback: dataProvider.getHorrorMovies,
              label: 'Horror',
              movieList: dataProvider.horrorMoviesList),
          MovieCategory(
              callback: dataProvider.getPopularMovies,
              label: 'Popular',
              movieList: dataProvider.popularMoviesList,
              imageHeight: 200),
          MovieCategoryCaroussel(
              callback: dataProvider.getThrillerMovies,
              label: 'Thriller',
              movieList: dataProvider.thrillerMoviesList),
        ],
      ),
    );
  }
}
