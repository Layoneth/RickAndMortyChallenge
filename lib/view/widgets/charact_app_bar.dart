import 'package:flutter/material.dart';
import 'package:rick_morty_challenge/core/constants.dart';
import 'package:rick_morty_challenge/core/styles.dart';
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
      title: Text(
        character.name,
        style: TextFontStyle.homeText.copyWith(color: Colors.black),
      ),
      background: FadeInImage(
        placeholder: const AssetImage(Constants.placeholderUrl),
        image: NetworkImage(character.image!),
        imageErrorBuilder: (_, object, stack) {
          return Image.asset(Constants.placeholderUrl);
        },
        fit: BoxFit.cover),
    ),
  );
}