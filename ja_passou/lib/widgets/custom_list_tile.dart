import 'package:flutter/material.dart';
import 'package:ja_passou/widgets/custom_list_view.dart';

class TileItem implements ListItem {
  final String title;
  final String subtitle;

  TileItem({this.title, this.subtitle});
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({Key key, this.title, this.subtile}) : super(key: key);

  final String title;
  final String subtile;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  Text(
                    subtile,
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 32,
              color: Theme.of(context).accentColor,
            ),
          ],
        ),
      ),
      onPressed: () {},
    );
  }
}
