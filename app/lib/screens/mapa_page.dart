import 'package:app/models/Arte.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:app/services/remote_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import 'package:retrofit/http.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  //API
  List<Arte>? artes;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    // fetch data from API
    getData();
  }

  getData() async {
    artes = await RemoteService().getArtes();
    if (artes != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;
  late Position currentPosition;
  //Set<Marker> _markers = Set<Marker>();
  List<Marker> _markers = [];

  var geoLocator = Geolocator();

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLatPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        new CameraPosition(target: latLatPosition, zoom: 18);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(38.70723439106229, -9.152428676689576),
    zoom: 14.4746,
  );

  void createMarker() {
    for (int i = 0; i < artes!.length; i++) {
      _markers.add(Marker(
        markerId: MarkerId(artes![i].artesNome), //way points
        position: LatLng(artes![i].latitude, artes![i].longitude),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        markers: _markers.map((e) => e).toSet(),
        myLocationEnabled: true,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controllerGoogleMap.complete(controller);
          newGoogleMapController = controller;
          locatePosition();
          createMarker();
        },
      ),
    );
  }
}
