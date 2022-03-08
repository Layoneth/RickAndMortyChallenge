import 'package:flutter/material.dart';
import 'package:rick_morty_challenge/data/models/character_model.dart';
import 'package:rick_morty_challenge/view/widgets/body_char.dart';
import 'package:rick_morty_challenge/view/widgets/charact_app_bar.dart';

class CharacterDetailPage extends StatelessWidget {
  final Character character;
  const CharacterDetailPage({Key? key, required this.character}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          AppBarCharacter(character: character),
          BodyDetailCharacter(character: character,),
        ],
      ),
    );
  }
}