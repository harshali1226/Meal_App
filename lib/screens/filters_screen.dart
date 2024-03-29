import 'package:flutter/material.dart';
import 'package:meals/widgets/main_drawer.dart';
class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String , bool> currentFilters;
  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _vegan = false;
  bool _vegetarian = false;
  bool _glutenFree = false;
  bool _lactoseFree = false;
  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
        _lactoseFree = widget.currentFilters['lactose'];

    _vegan = widget.currentFilters['vegan'];

    _vegetarian = widget.currentFilters['vegetarian'];

    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description, bool currentValue, Function updateValue) {
    return SwitchListTile(
                title: Text(title),
                subtitle: Text(description),
                value: currentValue,
                onChanged: updateValue
              );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: () {
            final selectedFilters = {
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegan': _vegan,
              'vegetarian': _vegetarian,
            };
            widget.saveFilters(selectedFilters);
            })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Text('Adjust your filters here!!',
            style: Theme.of(context).textTheme.title,
            ),
            ),
            Expanded(child: ListView(children: <Widget>[
              _buildSwitchListTile(
                'Gluten-free',
                'Only include Gluten-free meals',
                _glutenFree,
                (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              },
              ),
              _buildSwitchListTile(
                'Lactose-free',
                'Only include Lactose-free meals',
                _lactoseFree,
                (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              },
              ),
              _buildSwitchListTile(
                'Vegan',
                'Only include Vegan meals',
                _vegan,
                (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              },
              ),
              _buildSwitchListTile(
                'Vegetarian',
                'Only include Vegetarian meals',
                _vegetarian,
                (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              },
              )
            ],
            ),
            )
        ]
      )
    );
  }
}