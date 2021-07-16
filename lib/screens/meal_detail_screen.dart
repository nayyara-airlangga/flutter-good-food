import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal-detail';

  const MealDetailScreen({
    Key key,
    this.toggleFavorite,
    this.isFavoriteMeal,
  }) : super(key: key);

  final Function toggleFavorite;
  final Function isFavoriteMeal;

  Container buildSectionTitle({BuildContext context, String text}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6.copyWith(
              color: Theme.of(context).accentColor,
            ),
      ),
    );
  }

  Container buildContainer({BuildContext context, Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        border: Border.all(
          color: Theme.of(context).primaryColorDark,
          width: 4,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 155,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String mealID = ModalRoute.of(context).settings.arguments as String;
    final Meal selectedMeal =
        dummyMeals.firstWhere((meal) => meal.id == mealID);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        title: Text(
          selectedMeal.name,
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageURL,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            buildSectionTitle(
              context: context,
              text: 'Ingredients',
            ),
            buildContainer(
              context: context,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(
              context: context,
              text: 'Steps',
            ),
            buildContainer(
              context: context,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Text('${index + 1}'),
                        ),
                        title: Text(
                          selectedMeal.steps[index],
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                      Divider(
                        color: Theme.of(context).accentColor,
                      ),
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
            const SizedBox(height: 20),
            // ...selectedMeal.ingredients
            //     .map(
            //       (ingredient) => Text(ingredient),
            //     )
            //     .toList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavoriteMeal(mealID) ? Icons.star : Icons.star_border,
          color: Theme.of(context).accentColor,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => toggleFavorite(mealID),
      ),
    );
  }
}
