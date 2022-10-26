import 'package:flutter/material.dart';
import 'package:pokedex/commons/customButton.dart';
import 'package:pokedex/commons/grid.dart';
import 'package:pokedex/commons/scrollableContainer.dart';
import 'package:pokedex/themes/color.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScrollableContainer(
            container: Container(
                margin: EdgeInsets.only(top: 40),
                child: Grid(elements: [
                  Container(
                    width: MediaQuery.of(context).size.width * .9,
                    height: MediaQuery.of(context).size.height * .2,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .05,
                        right: MediaQuery.of(context).size.width * .05,
                        bottom: 30),
                    child: CustomButton(
                        text: 'Pokemon list',
                        color: Colors.white,
                        bgColor: CustomColors.PoisonColor,
                        function: () {
                          Navigator.pushNamed(context, '/pokemon');
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .9,
                    height: MediaQuery.of(context).size.height * .2,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .05,
                        right: MediaQuery.of(context).size.width * .05,
                        bottom: 30),
                    child: CustomButton(
                        text: 'Pokemon types',
                        color: Colors.white,
                        bgColor: CustomColors.IceColor,
                        function: () {
                          Navigator.pushNamed(context, '/types');
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .9,
                    height: MediaQuery.of(context).size.height * .2,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .05,
                        right: MediaQuery.of(context).size.width * .05,
                        bottom: 30),
                    child: CustomButton(
                        text: 'Pokemon abilities',
                        color: Colors.white,
                        bgColor: CustomColors.GrassColor,
                        function: () {
                          Navigator.pushNamed(context, '/abilities');
                        }),
                  ),

                ], elementsPerLine: 1))));
  }
}
