import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 40,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[300],
          labelText: "Plz Input",
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
