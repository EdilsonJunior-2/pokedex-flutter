import 'package:flutter/material.dart';

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
            TextButton(
              child: Text(
                'Pokemon List',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF98D8D8),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/pokemon');
              },
            ),
            TextButton(
              child: Text(
                'Pokemon Types',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFA8A878),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/types');
              },
            ),
            TextButton(
              child: Text(
                'Abilities',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF78C850),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/abilities');
              },
            ),
          ],
        ),
      ),
    );
  }
}
