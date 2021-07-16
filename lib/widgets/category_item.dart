import 'package:flutter/material.dart';

import '../screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key key,
    this.id,
    this.title,
    this.backgroundColor,
  }) : super(key: key);

  final String id;
  final String title;
  final Color backgroundColor;

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'category ID': id,
        'category Title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          // border: Border.all(
          //   color: Theme.of(context).accentColor,
          //   width: 3,
          // ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: <Color>[
              backgroundColor.withOpacity(0),
              backgroundColor.withOpacity(0.8),
            ],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: Theme.of(context).accentColor.withOpacity(0.8),
              ),
        ),
      ),
    );
  }
}
