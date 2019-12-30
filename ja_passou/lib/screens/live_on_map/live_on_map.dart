import 'package:flutter/material.dart';

class LiveOnMapScreenArguments {
  final String title;
  final String lineId;

  LiveOnMapScreenArguments({this.title, this.lineId});
}

class LiveOnMapScreen extends StatelessWidget {
  const LiveOnMapScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LiveOnMapScreenArguments args =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        centerTitle: false,
        title: Text(args.title, style: Theme.of(context).textTheme.title),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).iconTheme.color,
            size: Theme.of(context).iconTheme.size,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(),
    );
  }
}
