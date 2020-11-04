import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleMapController mapController;

  List<Marker> myMarker = [];

  final LatLng _center = const LatLng(6.927079, 79.861244);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 10.0,
          ),
          markers: Set.from(myMarker),
          onTap: _handleTap,
          
        ),
      ),
    );
  }

  _handleTap(LatLng tappedPoint) {
    print(tappedPoint);
    setState(() {
      myMarker = [];
      myMarker.add(Marker(
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
         // draggable: true,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          // onDragEnd: (dragEndPosition) {
          //   print(dragEndPosition);
          // }
          ));
    });
  }
}
