import 'package:flutter/material.dart';
import 'package:rick_morty_challenge/core/constants.dart';
import 'package:rick_morty_challenge/data/models/character_model.dart';

class AppBarCharacter extends StatelessWidget {
  final Character character;
  const AppBarCharacter({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverAppBar(
    pinned: true,
    elevation: 10.0,
    expandedHeight: 200,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      title: Text(character.name),
      background: FadeInImage(
        placeholder: const NetworkImage(Constants.placeholderUrl),
        image: NetworkImage(character.image!),
        fit: BoxFit.cover),
    ),
  );
}