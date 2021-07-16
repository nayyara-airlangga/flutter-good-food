import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen({
    Key key,
    this.saveFilters,
    this.currentFilters,
  }) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten-free'];
    _lactoseFree = widget.currentFilters['lactose-free'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final Map<String, bool> selectedFilters = {
                'gluten-free': _glutenFree,
                'lactose-free': _lactoseFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
              };
              widget.saveFilters(
                filterData: selectedFilters,
              );
            },
            icon: Icon(Icons.save),
          ),
        ],
        title: Text(
          'Filters',
          style: TextStyle(
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meals selection',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Theme.of(context).accentColor),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                    context: context,
                    title: 'Gluten-Free',
                    description: 'Only include gluten-free meals',
                    currentValue: _glutenFree,
                    updateValue: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }),
                _buildSwitchListTile(
                    context: context,
                    title: 'Lactose-Free',
                    description: 'Only include lactose-free meals',
                    currentValue: _lactoseFree,
                    updateValue: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),
                _buildSwitchListTile(
                    context: context,
                    title: 'Vegetarian',
                    description: 'Only include vegetarian meals',
                    currentValue: _vegetarian,
                    updateValue: (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }),
                _buildSwitchListTile(
                    context: context,
                    title: 'Vegan',
                    description: 'Only include vegan meals',
                    currentValue: _vegan,
                    updateValue: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  SwitchListTile _buildSwitchListTile({
    BuildContext context,
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  }) {
    return SwitchListTile(
      inactiveTrackColor: Theme.of(context).primaryColor,
      activeTrackColor: Theme.of(context).accentColor.withOpacity(0.8),
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).accentColor),
      ),
      subtitle: Text(
        description,
        style: TextStyle(color: Theme.of(context).accentColor),
      ),
      value: currentValue,
      onChanged: updateValue,
    );
  }
}
