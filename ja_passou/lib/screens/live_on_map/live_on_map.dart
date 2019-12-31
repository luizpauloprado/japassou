import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class LiveOnMapScreenArguments {
  final String title;
  final String lineId;

  LiveOnMapScreenArguments({this.title, this.lineId});
}

class MyMap extends StatefulWidget {
  MyMap({Key key}) : super(key: key);

  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(-23.550520, -46.633308);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
    );
  }
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
      body: MyMap(),
    );
  }
}
