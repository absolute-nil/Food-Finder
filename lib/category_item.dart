import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String _title;
  final Color _color;
  CategoryItem(this._title, this._color);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(_title),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [_color.withOpacity(0.7), _color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
