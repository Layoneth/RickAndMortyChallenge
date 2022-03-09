import 'package:flutter/material.dart';
import 'package:rick_morty_challenge/core/constants.dart';
import 'package:rick_morty_challenge/data/models/character_model.dart';

class BodyDetailCharacter extends StatelessWidget {
  final Character character;
  const BodyDetailCharacter({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverList(
    delegate: SliverChildListDelegate([
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            MinInformation(movie: character),
            const SizedBox(height: 8.0,),
            Text(character.name)
          ],
        ),
      )
    ]));
}

class MinInformation extends StatelessWidget {
  final Character movie;
  const MinInformation({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
    children: <Widget>[
      Hero(
        tag: movie.id,
        child: SizedBox(
          height: 230,
          width: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: const AssetImage(Constants.placeholderUrl), 
              image: NetworkImage(movie.image!),
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
            const Icon(Icons.star_border),
            Text(movie.created.toString())
          ],),
          Row(children: <Widget>[
            const Icon(Icons.trending_up),
            Text(movie.species!)
          ],)
        ],
      )
    ],
  );
}