import 'package:flutter/material.dart';
import 'package:pokedex/commons/grid.dart';
import 'package:pokedex/cubit/stats/stats_model.dart';

class Stats extends StatefulWidget {
  Stats({Key? key, required this.statsList, required this.textColor})
      : super(key: key);

  final List<StatsModel> statsList;
  final Color textColor;
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  stats() {
    return widget.statsList.map(
      (stat) => Container(
        width: MediaQuery.of(context).size.width * 0.3,
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .05,
            right: MediaQuery.of(context).size.width * .05,
            bottom: 5),
        child: Text(
          ("${stat.name}: ${stat.value}"),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: widget.textColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            top: 10,
            left: MediaQuery.of(context).size.width * .05,
            right: MediaQuery.of(context).size.width * .05),
        child: Grid(elements: [...stats()], elementsPerLine: 2));
  }
}
