import 'package:flutter/material.dart';
import 'package:rick_morty_challenge/core/constants.dart';
import 'package:rick_morty_challenge/data/models/character_model.dart';

class Utils {
  static Color getColorFromGender(Character character) {
    switch (character.gender) {
      case Constants.femaleGender:
        return Colors.pinkAccent;
      case Constants.maleGender:
        return Colors.blueAccent;
      default:
        return Colors.teal;
    }
  }
  static IconData getIconFromGender(Character character) {
    switch (character.gender) {
      case Constants.femaleGender:
        return Icons.female;
      case Constants.maleGender:
        return Icons.male;
      default:
        return Icons.android;
    }
  }

  static Color getColorFromSpecie(Character character) {
    if (character.species == Constants.humanSpecie) {
      return Colors.blueGrey;
    } else {
      return Colors.amber;
    }
  }

  static IconData getIconFromSpecie(Character character) {
    if (character.species == Constants.humanSpecie) {
      return Icons.man;
    } else {
      return Icons.android;
    }
  }

  static Color getColorFromStatus(Character character) {
    switch (character.status) {
      case Constants.aliveStatus:
        return Colors.green;
      case Constants.deadStatus:
        return Colors.black;
      default:
        return Colors.teal;
    }
  }
  static IconData getIconFromStatus(Character character) {
    switch (character.status) {
      case Constants.aliveStatus:
        return Icons.plus_one;
      case Constants.deadStatus:
        return Icons.dangerous_rounded;
      default:
        return Icons.android;
    }
  }

}
