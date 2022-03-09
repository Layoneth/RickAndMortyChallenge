import 'package:flutter/material.dart';
import 'package:rick_morty_challenge/core/constants.dart';
import 'package:rick_morty_challenge/core/utils.dart';
import 'package:rick_morty_challenge/data/models/character_model.dart';

class BodyDetailCharacter extends StatelessWidget {
  final Character character;
  const BodyDetailCharacter({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverList(
    delegate: SliverChildListDelegate([
      Container(
        color: Utils.getColorFromSpecie(character),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            MinInformation(character: character),
          ],
        ),
      )
    ]));
}

class MinInformation extends StatelessWidget {
  final Character character;
  const MinInformation({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
    children: <Widget>[
      Hero(
        tag: character.id,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: SizedBox(
            height: 230,
            width: 150,
            child: FadeInImage(
              placeholder: const AssetImage(Constants.placeholderUrl), 
              image: NetworkImage(character.image!),
              imageErrorBuilder: (_, object, stack) {
                return Image.asset(Constants.placeholderUrl);
              },
            ),
          ),
        ),
      ),
      const SizedBox(width: 16.0,),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(children: <Widget>[
            const Icon(Icons.calendar_month),
            Text(character.created!.split('T').elementAt(0))
          ],),
          Row(children: <Widget>[
            Icon(
              Utils.getIconFromSpecie(character),
              color: Utils.getColorFromGender(character),
            ),
            Text(character.species!)
          ],),
          Row(children: <Widget>[
            Icon(
              Utils.getIconFromGender(character),
              color: Utils.getColorFromGender(character),
            ),
            Text(character.gender!)
          ],),
          Row(children: <Widget>[
            Icon(
              Utils.getIconFromStatus(character),
              color: Utils.getColorFromStatus(character),
            ),
            Text(character.status!)
          ],),
        ],
      )
    ],
  );
}