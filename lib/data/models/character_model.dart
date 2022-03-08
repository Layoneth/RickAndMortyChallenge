import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:rick_morty_challenge/data/models/info_model.dart';

@entity
class Character {
  Character({
    required this.id,
    required this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.image,
    required this.created,
  });

  @primaryKey
  final String id;
  final String name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final String? image;
  final String? created;

  factory Character.fromJson(String str) => Character.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Character.fromMap(Map<String, dynamic> json) => Character(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    species: json["species"],
    type: json["type"],
    gender: json["gender"],
    image: json["image"],
    created: json["created"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "status": status,
    "species": species,
    "type": type,
    "gender": gender,
    "image": image,
    "created": created,
  };
}

class Location {
  Location({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Location.fromMap(Map<String, dynamic> json) => Location(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "url": url,
  };
}

class ListCharacters {
  ListCharacters({
    required this.info,
    required this.results,
  });

  final Info info;
  final List<Character> results;

  factory ListCharacters.fromJson(Map<String, dynamic> json) => ListCharacters(
    info: Info.fromJson(json["info"]),
    results: List<Character>.from(
      json["results"].map((x) => Character.fromMap(x))),
  );

  Map<String, dynamic> toJson() => {
    "info": info.toJson(),
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}
