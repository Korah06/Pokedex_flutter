import 'dart:convert';

import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;
  final List<String> types;
  final String imageUrl;

  const Pokemon(
      {required this.id, required this.name, required this.types, required this.imageUrl});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final typesList = (json['types'] as List)
        .map((type) => type['type']['name'] as String)
        .toList();

    final imageUrl = json['sprites']['front_default'] as String;

    return Pokemon(
      name: json['name'],
      id: json['id'],
      types: typesList,
      imageUrl: imageUrl,
    );
  }

  @override
  List<Object?> get props => [id, name, types, imageUrl];
}
