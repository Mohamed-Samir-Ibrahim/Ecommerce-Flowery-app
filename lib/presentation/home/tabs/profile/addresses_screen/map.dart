import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class  map extends StatefulWidget {
   map ({super.key,required this.onAddressPicked});
   final Function(String)? onAddressPicked;

  @override
  State<map> createState() => _mapState();


}

class _mapState extends State<map> {
  GoogleMapController? mapController;
  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.03333,31.233334
    ),
    zoom: 6,
  );
List<Marker> markers = <Marker>[];
  @override


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:GoogleMap(
        markers: markers.toSet(),
        onTap: (LatLng latLng) async{
          List<Placemark> placemarks = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
          widget.onAddressPicked!("${placemarks[0].country!},${placemarks[0].locality!},${placemarks[0].street!}");

          markers.add(Marker(markerId: MarkerId('1'),position: LatLng(latLng.longitude, latLng.latitude)));
setState(() {

});},
        initialCameraPosition: _kGooglePlex,)

    );}
  }
