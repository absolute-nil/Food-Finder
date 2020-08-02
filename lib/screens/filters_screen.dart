import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters-screen";
  final Function saveFilters;
  final Map<String, bool> filters;

  FiltersScreen(this.saveFilters, this.filters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;

  bool _vegetarian = false;

  bool _vegan = false;

  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.filters['gluten-free'];
    _lactoseFree = widget.filters['lactose-free'];
    _vegan = widget.filters['vegan'];
    _vegetarian = widget.filters['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool value, Function onChanged) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filters"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten-free': _glutenFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                  'lactose-free': _lactoseFree
                };
                widget.saveFilters(selectedFilters);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Adjust your settings",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.black),
                )),
            Expanded(
                child: ListView(
              children: <Widget>[
                _buildSwitchListTile("Gluten-free",
                    "only include gluten free meals", _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    "Vegetarian", "only include vegetarian  meals", _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchListTile(
                    "Vegan", "only include vegan meals", _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                _buildSwitchListTile(
                    "Lactose-free",
                    "only include lactose free meals",
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                })
              ],
            ))
          ],
        ));
  }
}
