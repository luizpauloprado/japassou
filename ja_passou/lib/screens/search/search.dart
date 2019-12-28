import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 32.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          // height: 40.0,
          child: TextField(
            autocorrect: false,
            enableSuggestions: false,
            autofocus: true,
            decoration: InputDecoration(
              fillColor: Colors.blue,
              filled: true,
              hasFloatingPlaceholder: false,
              hintText: "Qual ônibus você usa?",
              isDense: true,
              contentPadding: EdgeInsets.all(8),
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                  width: 0, 
                  style: BorderStyle.none,
              ),
          ),
            ),
          ),
        ),
      ),
    );
  }
}
