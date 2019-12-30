import 'package:flutter/material.dart';
import 'package:ja_passou/widgets/section.dart';
import 'package:ja_passou/widgets/tile.dart';

abstract class ListItem {
  final String title;

  ListItem({this.title});
}

class SectionItem implements ListItem {
  final String title;

  SectionItem({this.title});
}

class TileItem implements ListItem {
  final String title;
  final String subtitle;
  final bool showShadow;
  final VoidCallback onPressed;

  TileItem({this.title, this.subtitle, this.showShadow = false, this.onPressed});
}

class CustomListView extends StatelessWidget {
  const CustomListView({Key key, this.items}) : super(key: key);

  final List<ListItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) {
          if (items[index] is TileItem)
            return Divider(height: 0);
          else
            return Container();
        },
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          if (item is SectionItem) {
            return Section(title: item.title);
          } else if (item is TileItem) {
            return Tile(
              title: item.title,
              subtile: item.subtitle,
              showShadow: item.showShadow,
              onPressed: item.onPressed,
            );
          } else {
            return null;
          }
        });
  }
}
