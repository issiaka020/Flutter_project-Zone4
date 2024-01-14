// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:zone4/models/person.dart';
import 'package:zone4/services/api.dart';

class Movie {
  final int id;
  final String name;
  final String description;
  final String? posterPath;
  final List<String>? genres;
  final String? releaseDate;
  final double? vote;
  final List<String>? videoKey;
  final List<Person>? casting;
  final List<String>? imagesURL;
  final List<Movie>? similar;

  /*these variable at the beginning is empty 
   we initialize them as nullable then after once 
   we click on a movie that then thse variable will be assign to some info
   */

  Movie({
    required this.id,
    required this.name,
    required this.description,
    this.posterPath,
    this.genres,
    this.releaseDate,
    this.vote,
    this.videoKey,
    this.casting,
    this.imagesURL,
    this.similar,
  });

  Movie copyWith({
    int? id,
    String? name,
    String? description,
    String? posterPath,
    List<String>? genres,
    String? releaseDate,
    double? vote,
    List<String>? videoKey,
    List<Person>? casting,
    List<String>? imagesURL,
    List<Movie>? similar,
  }) {
    return Movie(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      posterPath: posterPath ?? this.posterPath,
      genres: genres ?? this.genres,
      releaseDate: releaseDate ?? this.releaseDate,
      vote: vote ?? this.vote,
      videoKey: videoKey ?? this.videoKey,
      casting: casting ?? this.casting,
      imagesURL: imagesURL ?? this.imagesURL,
      similar: similar ?? this.similar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'posterPath': posterPath,
    };
  }

  factory Movie.fromJson(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as int,
      name: map['title'] as String,
      description: map['overview'] as String,
      posterPath:
          map['poster_path'] != null ? map['poster_path'] as String : null,
    );
  }

  String posterURL() {
    API api = API();
    return api.baseImageURL + posterPath!;
  }

  String reformatGenres() {
    String result = '';
    for (int i = 0; i < genres!.length; i++) {
      if (i == genres!.length - 1) {
        result = result + genres![i];
      } else {
        result = '$result${genres![i]}, ';
      }
    }

    return result;
  }
}
