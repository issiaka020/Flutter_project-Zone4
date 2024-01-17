// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:zone4/services/api.dart';

class Person {
  final String name;
  final String characterName;
  final String? imageURL;
  final int id;
  final List<Map<String, dynamic>>? actor;
  Person({
    required this.name,
    required this.characterName,
    this.imageURL,
    required this.id,
    this.actor,
  });

  Person copyWith(
      {String? name,
      String? characterName,
      String? imageURL,
      int? id,
      List<Map<String, dynamic>>? actor}) {
    return Person(
        name: name ?? this.name,
        characterName: characterName ?? this.characterName,
        imageURL: imageURL ?? this.imageURL,
        id: id ?? this.id,
        actor: actor ?? this.actor);
  }

  factory Person.fromjson(Map<String, dynamic> map) {
    return Person(
      name: map['name'] as String,
      characterName: map['character'] as String,
      imageURL:
          map['profile_path'] != null ? map['profile_path'] as String : null,
      id: map['id'],
    );
  }
  String castingImageURL() {
    API api = API();
    return api.baseImageURL + imageURL!;
  }
}
