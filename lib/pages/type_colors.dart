import 'package:flutter/material.dart';

class ColorList {
  const ColorList({
    required this.name,
    required this.color,
  });

  final String name;
  final Color color;
}

returnColor(String name) {
  Color response = Colors.black;

  for (var i = 0; i < 18; i++) {
    if (colors[i].name == name) {
      response = colors[i].color;
    }
  }
  return response;
}

List<ColorList> colors = [
  new ColorList(
    name: "normal",
    color: Color(0xFFA8A878),
  ),
  new ColorList(
    name: "grass",
    color: Color(0xFF78C850),
  ),
  new ColorList(
    name: "fire",
    color: Color(0xFFF08030),
  ),
  new ColorList(
    name: "water",
    color: Color(0xFF6890F0),
  ),
  new ColorList(
    name: "bug",
    color: Color(0xFFA8B820),
  ),
  new ColorList(
    name: "poison",
    color: Color(0xFFA040A0),
  ),
  new ColorList(
    name: "electric",
    color: Color(0xFFF8D030),
  ),
  new ColorList(
    name: "ground",
    color: Color(0xFFE0C068),
  ),
  new ColorList(
    name: "fairy",
    color: Color(0xFFEE99AC),
  ),
  new ColorList(
    name: "fighting",
    color: Color(0xFFC03028),
  ),
  new ColorList(
    name: "flying",
    color: Color(0xFFB3B3FF),
  ),
  new ColorList(
    name: "steel",
    color: Color(0xFFC0C0C0),
  ),
  new ColorList(
    name: "dark",
    color: Color(0xFF3E223A),
  ),
  new ColorList(
    name: "psychic",
    color: Color(0xFFF85888),
  ),
  new ColorList(
    name: "rock",
    color: Color(0xFFB8A038),
  ),
  new ColorList(
    name: "ice",
    color: Color(0xFF98D8D8),
  ),
  new ColorList(
    name: "ghost",
    color: Color(0xFF705898),
  ),
  new ColorList(
    name: "dragon",
    color: Color(0xFF7038F8),
  ),
];
