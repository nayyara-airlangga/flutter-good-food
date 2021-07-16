import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key key,
  }) : super(key: key);

  ListTile buildListTile({
    BuildContext context,
    IconData iconData,
    String title,
    Function onTap,
  }) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26,
        color: Theme.of(context).accentColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).accentColor,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          // border: Border(
          //   right: BorderSide(color: Theme.of(context).accentColor, width: 4),
          //   bottom: BorderSide(color: Theme.of(context).accentColor, width: 4),
          // ),
        ),
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  color: Theme.of(context).accentColor,
                  child: Text(
                    'GoodFood',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.close,
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            buildListTile(
              iconData: Icons.restaurant,
              title: 'Meals',
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
              context: context,
            ),
            buildListTile(
              iconData: Icons.settings,
              title: 'Filters',
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(FiltersScreen.routeName);
              },
              context: context,
            ),
          ],
        ),
      ),
    );
  }
}
