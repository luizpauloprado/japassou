import 'package:flutter/material.dart';
import 'package:ja_passou/widgets/shadow.dart';

class Tile extends StatelessWidget {
  const Tile({Key key, this.title, this.subtile, this.showShadow})
      : super(key: key);

  final String title;
  final String subtile;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FlatButton(
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
        ),
        decoration: showShadow ? Shadow() : null);
  }
}
