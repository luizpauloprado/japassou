import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  GoogleMapController _controller;
  String _mapStyle;
  LatLng _currentPosition = LatLng(-23.550520, -46.633308);
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/configs/map_style.json').then((string) {
      _mapStyle = string;
    });
    _getCurrentPositon();
    _addMarker();
  }

  void _getCurrentPositon() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = LatLng(position.latitude, position.latitude);
    });
  }

  void _addMarker() async {
    final icon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(57, 67)),
      'assets/images/marker_bus.png',
    );
    _markers.add(
      Marker(
        markerId: MarkerId('id'),
        position: LatLng(-23.557859,-46.641162),
        icon: icon,
      ),
    );
    _markers.add(
      Marker(
        markerId: MarkerId('id2'),
        position: LatLng(-23.559573,-46.642605),
        icon: icon,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
    _controller.setMapStyle(_mapStyle);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      onMapCreated: _onMapCreated,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      markers: _markers,
      initialCameraPosition: CameraPosition(
        target: _currentPosition,
        zoom: 16.0,
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
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).iconTheme.color,
              size: Theme.of(context).iconTheme.size,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Theme.of(context).iconTheme.color,
              size: Theme.of(context).iconTheme.size,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: MyMap(),
    );
  }
}
