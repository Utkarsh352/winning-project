import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String description;
  SearchBar(this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: description,
          icon: Icon(Icons.search), // Removed redundant Icon() wrapper
          border: InputBorder.none,
        ),
      ),
    );
  }
}
