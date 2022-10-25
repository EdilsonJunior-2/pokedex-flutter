import 'package:flutter/material.dart';

class OptionsList {
  const OptionsList({required this.url, required this.name});

  final String url;
  final String name;
}

class ListSchema {
  const ListSchema({
    required this.listName,
    required this.typeName,
    required this.color,
    required this.optionsList
  });
  final String listName;
  final String typeName;
  final Color color;
  final List<OptionsList> optionsList;
}