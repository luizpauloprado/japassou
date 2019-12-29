import 'package:flutter/material.dart';
import 'package:ja_passou/screens/search/search.dart';
import 'package:ja_passou/widgets/custom_list_section.dart';
import 'package:ja_passou/widgets/custom_list_tile.dart';
import 'package:ja_passou/widgets/custom_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Image.asset(
          'assets/images/logo.png',
          height: 40.0,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: 32.0,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
              },
            ),
          ),
        ],
      ),
      body: CustomListView(
        items: [
          SectionItem(title: "LINHAS FAVORITAS"),
          TileItem(title: "106A-10", subtitle: "Metro Santana > Itaim Bibi"),
          TileItem(title: "106A-10", subtitle: "Metro Santana > Itaim Bibi"),
          TileItem(title: "106A-10", subtitle: "Metro Santana > Itaim Bibi"),
          TileItem(title: "106A-10", subtitle: "Metro Santana > Itaim Bibi"),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.search),
      //   onPressed: () {},
      // ),
    );
  }
}
