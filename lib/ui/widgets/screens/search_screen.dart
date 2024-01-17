import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zone4/models/movie.dart';
import 'package:zone4/ui/widgets/screens/movie_details_page.dart';

import 'package:zone4/utils/constant.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.movies});
  final List<Movie> movies;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Movie>? allmovies;
  List<Movie> searchMovies(String query) {
    // we are removing the duplicate movie to facilitate the search
    List<Movie> removeDuplicateMovies = [];
    Set<String> uniqueNames = <String>{};
    for (var movie in widget.movies) {
      if (uniqueNames.add(movie.name)) {
        removeDuplicateMovies.add(movie);
      }
    }

    //
    return removeDuplicateMovies
        .toSet()
        .toList()
        .where(
            (movie) => movie.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    allmovies = searchMovies(searchController.text);
  }

  final TextEditingController searchController = TextEditingController();
  final FocusNode focuseNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
    focuseNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: TextFormField(
          controller: searchController,
          focusNode: focuseNode,
          onFieldSubmitted: (value) {
            focuseNode.unfocus();
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(5),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            hintText: 'Search for movies',
            //focusColor: Colors.red,
            fillColor: Colors.grey[600],
            filled: true,
          ),
          onChanged: (value) {
            setState(() {
              List<Movie> searchResults = searchMovies(value);
              allmovies = searchResults;
            });
          },
        ),
      ),
      body: searchController.text.isEmpty
          ? Container()
          : GridView.builder(
              itemCount: allmovies!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return MovieDetailsPage(movie: allmovies![index]);
                      },
                    ));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: allmovies![index].posterURL(),
                        width: 350,
                        fit: BoxFit.fill,
                        errorWidget: (context, url, error) {
                          return const Center(
                            child: Icon(Icons.error),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
