import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({Key key, this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: Colors.white,
        child: Wrap(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                text,
                style: Theme.of(context).textTheme.body2,
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.2),
          blurRadius: 2,
        )
      ]),
    );
  }
}
