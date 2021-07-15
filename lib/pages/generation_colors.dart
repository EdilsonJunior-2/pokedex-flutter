import 'package:flutter/material.dart';

class GenerationColorList{
  const GenerationColorList({
    required this.generation,
    required this.color,
});
  final String generation;
  final Color color;
}

returnColorByGeneration(String generation) {
  Color response = Colors.black;

  for (var i = 0; i < 8; i++) {
    if (colors[i].generation == generation) {
      response = colors[i].color;
    }
  }
  return response;
}

List<GenerationColorList> colors = [
  new GenerationColorList(
    generation: "generation-i",
    color: Color(0xFF78C850),
  ),
  new GenerationColorList(
    generation: "generation-ii",
    color: Color(0xFFF08030),
  ),
  new GenerationColorList(
    generation: "generation-iii",
    color: Color(0xFF6890F0),
  ),
  new GenerationColorList(
    generation: "generation-iv",
    color: Color(0xFFF8D030),
  ),
  new GenerationColorList(
    generation: "generation-v",
    color: Color(0xFFE0C068),
  ),
  new GenerationColorList(
    generation: "generation-vi",
    color: Color(0xFFEE99AC),
  ),
  new GenerationColorList(
    generation: "generation-vii",
    color: Color(0xFFC03028),
  ),
  new GenerationColorList(
    generation: "generation-viii",
    color: Color(0xFFF85888),
  ),
];
