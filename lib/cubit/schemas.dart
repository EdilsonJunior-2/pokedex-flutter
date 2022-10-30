import 'package:flutter/material.dart';

class OptionsList {
  const OptionsList({required this.url, required this.name, this.image = ""});

  final String url;
  final String name;
  final String? image;
}

class ListSchema {
  const ListSchema({
    required this.listName,
    required this.typeName,
    required this.color,
    required this.optionsList,
    required this.function,
  });
  final String listName;
  final String typeName;
  final Color color;
  final List<OptionsList> optionsList;
  final Function(int index) function;
}

class Variety {
  const Variety({
    required this.name,
    required this.code,
  });

  final String name;
  final String code;
}
