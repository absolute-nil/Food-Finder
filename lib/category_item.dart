import 'package:flutter/material.dart';
import './category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String _id;
  final String _title;
  final Color _color;
  CategoryItem(this._id, this._title, this._color);

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/category-meals', arguments: {'id': _id, 'title':_title}
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          _title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [_color.withOpacity(0.7), _color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
