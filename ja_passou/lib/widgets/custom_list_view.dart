import 'package:flutter/material.dart';
import 'package:ja_passou/widgets/custom_list_section.dart';
import 'package:ja_passou/widgets/custom_list_tile.dart';

abstract class ListItem {}

class CustomListView extends StatelessWidget {
  const CustomListView({Key key, this.items}) : super(key: key);

  final List<ListItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) {
          final item = items[index];
          return item is TileItem ? Divider(height: 0) : Container();
        },
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          if (item is SectionItem) {
            return CustomListSection(title: item.title);
          } else if (item is TileItem) {
            return CustomListTile(
              title: item.title,
              subtile: item.subtitle,
            );
          } else {
            return null;
          }
        });
  }
}
