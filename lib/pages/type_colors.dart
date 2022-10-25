import 'package:flutter/material.dart';
import 'package:pokedex/themes/color.dart';

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
    color: CustomColors.NormalColor,
  ),
  new ColorList(
    name: "grass",
    color: CustomColors.GrassColor,
  ),
  new ColorList(
    name: "fire",
    color: CustomColors.FireColor,
  ),
  new ColorList(
    name: "water",
    color: CustomColors.WaterColor,
  ),
  new ColorList(
    name: "bug",
    color: CustomColors.BugColor,
  ),
  new ColorList(
    name: "poison",
    color: CustomColors.PoisonColor,
  ),
  new ColorList(
    name: "electric",
    color: CustomColors.ElectricColor,
  ),
  new ColorList(
    name: "ground",
    color: CustomColors.GroundColor,
  ),
  new ColorList(
    name: "fairy",
    color: CustomColors.FairyColor,
  ),
  new ColorList(
    name: "fighting",
    color: CustomColors.FightingColor,
  ),
  new ColorList(
    name: "flying",
    color: CustomColors.FlyingColor,
  ),
  new ColorList(
    name: "steel",
    color: CustomColors.SteelColor,
  ),
  new ColorList(
    name: "dark",
    color: CustomColors.DarkColor,
  ),
  new ColorList(
    name: "psychic",
    color: CustomColors.PsychicColor,
  ),
  new ColorList(
    name: "rock",
    color: CustomColors.RockColor,
  ),
  new ColorList(
    name: "ice",
    color: CustomColors.IceColor,
  ),
  new ColorList(
    name: "ghost",
    color: CustomColors.GhostColor,
  ),
  new ColorList(
    name: "dragon",
    color: CustomColors.DragonColor,
  ),
];
