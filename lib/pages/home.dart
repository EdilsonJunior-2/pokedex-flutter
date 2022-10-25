import 'package:flutter/material.dart';
import 'package:pokedex/commons/customButton.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton(
                text: 'Pokemon list',
                color: Colors.white,
                bgColor: CustomColors.PoisonColor,
                function: () {
                  Navigator.pushNamed(context, '/pokemon');
                }),
            CustomButton(
                text: 'Pokemon types',
                color: Colors.white,
                bgColor: CustomColors.IceColor,
                function: () {
                  Navigator.pushNamed(context, '/types');
                }),
            CustomButton(
                text: 'Pokemon abilities',
                color: Colors.white,
                bgColor: CustomColors.GrassColor,
                function: () {
                  Navigator.pushNamed(context, '/abilities');
                })
          ],
        ),
      ),
    );
  }
}
