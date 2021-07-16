import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color backgroundColor;

  const Category({
    @required this.id,
    @required this.title,
    this.backgroundColor = Colors.orange,
  });
}
