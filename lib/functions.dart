import 'package:flutter/material.dart';
import 'package:pokedex/pages/generation_colors.dart';
import 'package:pokedex/pages/type_colors.dart';

isNullOrNot(value) {
  if (value != null) {
    return value;
  } else {
    return "doesn't exist";
  }
}

int getPokemonNumber(String str){
  return int.parse(str.replaceAll(new RegExp(r'\D+'), ""));
}


loading(context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.6,
    width: MediaQuery.of(context).size.width,
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

error(context, info) {
  return Center(
    child: Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.only(
        top: 35,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                ),
                color: Colors.black,
                onPressed: () => {
                  Navigator.pop(context),
                },
              ),
            ],
          ),
          Text(
            "An error occurred while getting the info about this $info, or there is no info about it in our database, sorry :(",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    ),
  );
}

appBarUsingType(context, name, type) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.14,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                ),
                color: returnColor(
                  type,
                ),
                onPressed: () => {
                  Navigator.pop(context),
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.65,
              alignment: Alignment.center,
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: returnColor(
                    type,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        height: 1,
        width: MediaQuery.of(context).size.width * 0.95,
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        color: returnColor(
          type,
        ),
      ),
    ],
  );
}

appBarUsingGeneration(context, name, generation) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.16,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                ),
                color: returnColorByGeneration(
                  generation,
                ),
                onPressed: () => {
                  Navigator.pop(context),
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.62,
              alignment: Alignment.center,
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: returnColorByGeneration(
                    generation,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        height: 1,
        width: MediaQuery.of(context).size.width * 0.95,
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        color: returnColorByGeneration(
          generation,
        ),
      ),
    ],
  );
}
