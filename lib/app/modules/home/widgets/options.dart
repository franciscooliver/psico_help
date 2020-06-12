import 'package:flutter/material.dart';

class Option {
  const Option({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Option> options = const <Option>[
  const Option(title: 'Logout', icon: Icons.delete_forever),
  // const Option(title: 'Bicycle', icon: Icons.directions_bike),
  // const Option(title: 'Boat', icon: Icons.directions_boat),
  // const Option(title: 'Bus', icon: Icons.directions_bus),
  // const Option(title: 'Train', icon: Icons.directions_railway),
  // const Option(title: 'Walk', icon: Icons.directions_walk),
];  
