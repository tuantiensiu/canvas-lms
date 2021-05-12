import 'package:flutter/material.dart';

class Course {
  int id;
  String name;
  String category;
  String imageUrl;
  String content;

  Course(
      {@required this.id,
      @required this.name,
      @required this.category,
      @required this.imageUrl,
      @required this.content});
}
