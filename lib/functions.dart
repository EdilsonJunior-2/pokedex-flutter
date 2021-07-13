import 'package:flutter/material.dart';

isNullOrNot(value) {
  if (value != null) {
    return value;
  } else {
    return "doesn't exist";
  }
}

loading (context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.6,
    width: MediaQuery.of(context).size.width,
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
