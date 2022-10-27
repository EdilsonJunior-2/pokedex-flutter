import "package:flutter/material.dart";
import 'package:pokedex/themes/color.dart';

class Region {
  const Region(
      {required this.name,
      required this.generationNumber,
      required this.color});

  final String name;
  final int generationNumber;
  final Color color;
}

List<Region> regionList = [
  Region(name: "Kanto", generationNumber: 1, color: CustomColors.ElectricColor),
  Region(name: "Jotho", generationNumber: 2, color: CustomColors.SteelColor),
  Region(name: "Hoenn", generationNumber: 3, color: CustomColors.WaterColor),
  Region(name: "Sinnoh", generationNumber: 4, color: CustomColors.IceColor),
  Region(name: "Unova", generationNumber: 5, color: CustomColors.PoisonColor),
  Region(name: "Kalos", generationNumber: 6, color: CustomColors.FairyColor),
  Region(name: "Alola", generationNumber: 7, color: CustomColors.FlyingColor),
  Region(name: "Galar", generationNumber: 8, color: CustomColors.DragonColor),
];
