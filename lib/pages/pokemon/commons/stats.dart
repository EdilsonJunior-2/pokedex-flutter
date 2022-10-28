import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:pokedex/helpers/utils.dart';
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

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width * .65,
      height: MediaQuery.of(context).size.width * .65,
      margin: EdgeInsets.only(bottom: 20),
      child:
      RadarChart(
        ticks: [40, 80, 120, 160, 200],
        features: [...widget.statsList.map((stat) => stat.name.toTitleCase())],
        data: [
          [...widget.statsList.map((stat) => stat.value)]
        ],
        graphColors: [Color(0xFFCFCFCF)],
        featuresTextStyle: TextStyle(
            color:Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18
        ),
        ticksTextStyle: TextStyle(
          color: Color(0xFFCFCFCF),
          fontWeight: FontWeight.bold,
              fontSize: 12
        ),
        axisColor: Color(0xFFCFCFCF),
        outlineColor: Color(0xFFCFCFCF),
        sides: 6,
      ),
    );
  }
}
