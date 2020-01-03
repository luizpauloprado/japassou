import 'package:flutter/material.dart';
import 'package:ja_passou/screens/live_on_map/live_on_map.dart';
import 'package:ja_passou/widgets/custom_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        centerTitle: false,
        title: Image.asset(
          'assets/images/logo.png',
          height: 40.0,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: Theme.of(context).iconTheme.color,
                size: Theme.of(context).iconTheme.size,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
            ),
          ),
        ],
      ),
      body: CustomListView(
        items: [
          SectionItem(title: "LINHAS FAVORITAS"),
          TileItem(
            title: "106A-10",
            subtitle: "Metro Santana > Itaim Bibi",
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/live-on-map',
                arguments: LiveOnMapScreenArguments(
                  title: '106A-10',
                  lineId: 'id',
                ),
              );
            },
          ),
          TileItem(
            title: "106A-10",
            subtitle: "Itaim Bibi > Metro Santana",
            onPressed: () {},
          ),
          TileItem(
            title: "715M-10",
            subtitle: "Metro Pinheiros > Sé",
            showShadow: true,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
