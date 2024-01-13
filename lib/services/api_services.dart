import 'package:zone4/models/movie.dart';
import 'package:zone4/models/person.dart';
import 'package:zone4/services/api.dart';
import 'package:dio/dio.dart';

class APIServices {
  final API api = API();
  final dio = Dio();

  Future<Response> getData(String path, Map<String, dynamic>? params) async {
    String url = api.baseURL + path;

    // these params are required on every call
    Map<String, dynamic> queryParameters = {
      'api_key': api.apiKey,
      'language': 'en-EN',
    };
    //if the additionnal params is not null than we add to the exisiting params to the query
    if (params != null) {
      queryParameters.addAll(params);
    }

    final response = await dio.get(url, queryParameters: queryParameters);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw response;
    }
  }

  Future<List<Movie>> getPopularMovies({required int pageNumber}) async {
    final response = await getData('movie/popular', {
      'page': pageNumber,
    });

    if (response.statusCode == 200) {
      List<dynamic> results = response.data['results'];
      List<Movie> popularMovies = [];
      for (Map<String, dynamic> jsonElement in results) {
        Movie movie = Movie.fromJson(jsonElement);
        popularMovies.add(movie);
      }
      return popularMovies;
    } else {
      throw response;
    }
  }

  Future<List<Movie>> getNowPlayingMovies({required int pageNumber}) async {
    final response = await getData('movie/now_playing', {
      'page': pageNumber,
    });

    if (response.statusCode == 200) {
      List<dynamic> results = response.data['results'];
      List<Movie> nowPlaying = [];
      for (Map<String, dynamic> jsonElement in results) {
        Movie movie = Movie.fromJson(jsonElement);
        nowPlaying.add(movie);
      }
      return nowPlaying;
    } else {
      throw response;
    }
  }

  Future<List<Movie>> getUpcomingMovies({required int pageNumber}) async {
    final response = await getData('movie/upcoming', {
      'page': pageNumber,
    });

    if (response.statusCode == 200) {
      List<dynamic> results = response.data['results'];
      List<Movie> upcomingMovies = [];
      for (Map<String, dynamic> jsonElement in results) {
        Movie movie = Movie.fromJson(jsonElement);
        upcomingMovies.add(movie);
      }
      return upcomingMovies;
    } else {
      throw response;
    }
  }

  Future<List<Movie>> getTopRatedMovies({required int pageNumber}) async {
    final response = await getData('movie/top_rated', {
      'page': pageNumber,
    });

    if (response.statusCode == 200) {
      List<dynamic> results = response.data['results'];
      List<Movie> topRatedMovies = [];
      for (Map<String, dynamic> jsonElement in results) {
        Movie movie = Movie.fromJson(jsonElement);
        topRatedMovies.add(movie);
      }
      return topRatedMovies;
    } else {
      throw response;
    }
  }

  Future<List<Movie>> getAnimationMovies({required int pageNumber}) async {
    final response = await getData('discover/movie', {
      'page': pageNumber,
      'with_genres': '16',
    });

    if (response.statusCode == 200) {
      List<dynamic> results = response.data['results'];
      List<Movie> animationMovies = [];
      for (Map<String, dynamic> jsonElement in results) {
        Movie movie = Movie.fromJson(jsonElement);
        animationMovies.add(movie);
      }
      return animationMovies;
    } else {
      throw response;
    }
  }

  Future<List<Movie>> getHorrorMovies({required int pageNumber}) async {
    final response = await getData('discover/movie', {
      'page': pageNumber,
      'with_genres': '27',
    });

    if (response.statusCode == 200) {
      List<dynamic> results = response.data['results'];
      List<Movie> horrorMovies = [];
      for (Map<String, dynamic> jsonElement in results) {
        Movie movie = Movie.fromJson(jsonElement);
        horrorMovies.add(movie);
      }
      return horrorMovies;
    } else {
      throw response;
    }
  }

  Future<List<Movie>> getThrillerMovies({required int pageNumber}) async {
    final response = await getData('discover/movie', {
      'page': pageNumber,
      'with_genres': '53',
    });

    if (response.statusCode == 200) {
      List<dynamic> results = response.data['results'];
      List<Movie> thrillerMovies = [];
      for (Map<String, dynamic> jsonElement in results) {
        Movie movie = Movie.fromJson(jsonElement);
        thrillerMovies.add(movie);
      }
      return thrillerMovies;
    } else {
      throw response;
    }
  }

  Future<Movie> getMovie({required Movie movie}) async {
    final response = await getData('movie/${movie.id}', {
      'include_image_language': 'null',
      'append_to_response': 'videos,images,credits,'
    });

    if (response.statusCode == 200) {
      Map data = response.data;

      // getting the genres info in one API call
      List<dynamic> genres = response.data['genres'];

      List<String> genreList = [];
      for (var element in genres) {
        genreList.add(element['name'] as String);
      }
      // getting the images info in one API call
      List<dynamic> backdrops = response.data['images']['backdrops'];
      List<String> imageURLs = [];
      for (var element in backdrops) {
        imageURLs.add(element['file_path']);
      }

      // getting the video info in one API call
      List<dynamic> results = response.data['videos']['results'];
      List<String> videoKeys = [];
      for (var element in results) {
        videoKeys.add(element['key']);
      }

      // getting the casting info in one API call
      List<dynamic> cast = response.data['credits']['cast'];
      List<Person> castingInfo = [];
      for (var element in cast) {
        Person person = Person.fromjson(element);
        castingInfo.add(person);
      }

      // getting the release date info in one API call

      return movie.copyWith(
        casting: castingInfo,
        genres: genreList,
        videoKey: videoKeys,
        imagesURL: imageURLs,
        releaseDate: data['release_date'],
        vote: data['vote_average'],
      );
    } else {
      throw response;
    }
  }
}
