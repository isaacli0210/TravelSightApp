import 'package:flutter/material.dart';
import 'package:travel_sight_app/Home/home_ui.dart';

void main() => runApp(TravelSightApp());

class TravelSightApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}