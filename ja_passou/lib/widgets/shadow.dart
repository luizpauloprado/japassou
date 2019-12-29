import 'package:flutter/material.dart';

// const Shadow = BoxDecoration(
//   boxShadow: [
//     BoxShadow(
//         color: Color.fromRGBO(0, 0, 0, 0.1),
//         blurRadius: 1,
//         offset: Offset(0.0, 1))
//   ],
// );

class Shadow extends BoxDecoration {
  @override
  final List<BoxShadow> boxShadow = const [
    BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.04),
        blurRadius: 2,
        offset: Offset(0.0, 2))
  ];

  const Shadow() : super();
}
