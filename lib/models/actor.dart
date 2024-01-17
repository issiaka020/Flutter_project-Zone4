// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:zone4/services/api.dart';

class Actor {
  final String name;
  final String biography;
  final String birthday;
  final int gender;
  final String placeOfBirth;
  final double popularity;
  final int id;
  final String profilePath;
  Actor({
    required this.name,
    required this.biography,
    required this.birthday,
    required this.gender,
    required this.placeOfBirth,
    required this.popularity,
    required this.id,
    required this.profilePath,
  });

  Actor copyWith({
    String? name,
    String? biography,
    String? birthday,
    int? gender,
    String? placeOfBirth,
    double? popularity,
    int? id,
    String? profilePath,
  }) {
    return Actor(
        name: name ?? this.name,
        biography: biography ?? this.biography,
        birthday: birthday ?? this.birthday,
        gender: gender ?? this.gender,
        placeOfBirth: placeOfBirth ?? this.placeOfBirth,
        popularity: popularity ?? this.popularity,
        id: id ?? this.id,
        profilePath: profilePath ?? this.profilePath);
  }

  factory Actor.fromJson(Map<String, dynamic> map) {
    return Actor(
      name: map['name'] as String,
      biography: map['biography'] as String,
      birthday: map['birthday'] as String,
      gender: map['gender'] as int,
      placeOfBirth: map['place_of_birth'] as String,
      popularity: map['popularity'] as double,
      id: map['id'] as int,
      profilePath: 'profile_path',
    );
  }
  String castingImageURL() {
    API api = API();
    return api.baseImageURL + profilePath;
  }
}
