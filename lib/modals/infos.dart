import 'package:flutter/material.dart';

class Info {
  Info({
    required this.title,
    required this.description,
    required this.iconData,
  });

  String title;
  String description;
  IconData iconData;
}

List<Info> infos = [
  Info(
    title: 'Pick Meals',
    description: 'Excepteur anim duis labore ullamco esse aute nisi nulla cillum reprehenderit minim.',
    iconData: Icons.mouse_rounded,
  ),
  Info(
    title: 'Pick Meals',
    description: 'Lorem fugiat dolor non excepteur duis proident qui veniam cupidatat excepteur id nulla id voluptate.',
    iconData: Icons.mouse_rounded,
  ),
  Info(
    title: 'Pick Meals',
    description: 'Excepteur anim duis labore ullamco esse aute nisi nulla cillum reprehenderit minim.',
    iconData: Icons.mouse_rounded,
  ),
  Info(
    title: 'Pick Meals',
    description: 'Lorem fugiat dolor non excepteur duis proident qui veniam cupidatat excepteur id nulla id voluptate.',
    iconData: Icons.mouse_rounded,
  ),
];
 

  
