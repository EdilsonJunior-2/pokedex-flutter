import 'package:flutter/material.dart';
import 'package:pokedex/helpers/utils.dart';
import 'package:pokedex/cubit/stats/stats_model.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

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
    return Column(
      children: [
        Container(
          height: 240,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.statsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * .02),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .2,
                     child: Text(widget.statsList[index].name.toTitleCase(),
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .1,
                      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * .02,
                          left: MediaQuery.of(context).size.width * .02,
                      ),
                      child: Text(
                        widget.statsList[index].value.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .55,
                      child: StepProgressIndicator(
                        totalSteps: 255,
                        currentStep: widget.statsList[index].value,
                        size: 8,
                        padding: 0,
                        unselectedColor: Colors.black26,
                        roundedEdges: Radius.circular(10),
                        selectedGradientColor: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            widget.textColor,
                            widget.textColor,
                          ],
                        ),

                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
