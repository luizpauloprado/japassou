import 'package:flutter/material.dart';
import 'package:ja_passou/widgets/custom_list_section.dart';
import 'package:ja_passou/widgets/custom_list_tile.dart';
import 'package:ja_passou/widgets/custom_list_view.dart';
import 'package:ja_passou/widgets/info.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key key}) : super(key: key);

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
        titleSpacing: 0,
        title: Container(
          padding: EdgeInsets.only(right: 16.0),
          child: TextField(
            autocorrect: false,
            enableSuggestions: false,
            autofocus: true,
            cursorColor: Colors.white,
            cursorWidth: 1.0,
            textInputAction: TextInputAction.search,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
            decoration: InputDecoration(
              fillColor: Color.fromRGBO(14, 140, 171, 1.0),
              filled: true,
              hasFloatingPlaceholder: false,
              hintText: "Qual ônibus você usa?",
              hintStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
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
      body: Column(
        children: <Widget>[
          Info(
            text:
                "É possível pesquisar um ônibus pelo número ou pelo nome da linha.",
          ),
          //Divider(height: 0),
          Expanded(
            child: CustomListView(
              items: [
                SectionItem(title: "RESULTADOS DA PESQUISA"),
                TileItem(
                    title: "106A-10", subtitle: "Metro Santana > Itaim Bibi"),
                TileItem(
                    title: "106A-10", subtitle: "Itaim Bibi > Metro Santana"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
