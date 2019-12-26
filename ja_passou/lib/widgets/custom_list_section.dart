import 'package:flutter/material.dart';
import 'package:ja_passou/widgets/custom_list_view.dart';

class SectionItem implements ListItem {
  final String title;

  SectionItem({this.title});
}

class CustomListSection extends StatelessWidget {
  const CustomListSection({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
