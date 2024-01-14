import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zone4/models/movie.dart';
import 'package:zone4/ui/widgets/movie_broadcast.dart';
import 'package:zone4/ui/widgets/screens/movie_details_page.dart';
import 'package:zone4/utils/constant.dart';

class SimilarTab extends StatefulWidget {
  const SimilarTab({super.key, this.movie, this.newmovie});
  final List<Movie>? movie;
  final Movie? newmovie;

  @override
  State<SimilarTab> createState() => _SimilarTabState();
}

class _SimilarTabState extends State<SimilarTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: TabBar(
              indicatorColor: kPrimaryColor1,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey[800],
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.bold),
              tabs: const [
                Tab(
                  text: 'Similar Title',
                ),
                Tab(
                  text: 'Trailer',
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: double.maxFinite,
            height: 400,
            child: TabBarView(
              children: [
                GridView.builder(
                  itemCount: widget.movie!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return MovieDetailsPage(
                                movie: widget.movie![index]);
                          },
                        ));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: widget.movie![index].posterURL(),
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
                MovieBroadcast(movie: widget.newmovie!, trailer: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
