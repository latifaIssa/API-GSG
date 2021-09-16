import 'package:api_gsg/providers/myprovider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class GoogleMapPage extends StatelessWidget {
  LatLng gazaLocation = LatLng(31.24, 34.19);
  GoogleMapController controller;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (contex, provider, x) {
      return Scaffold(
        body: GoogleMap(
          markers: provider.markers,
          onMapCreated: (x) {
            //to controll the controller of the map
            this.controller = x;
          },
          initialCameraPosition: CameraPosition(
            target: gazaLocation,
            zoom: 11.0,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: gazaLocation,
                  zoom: 11,
                ),
              ),
            );
            //each marker have specific id
            provider.addMarkerToSet(
                Marker(markerId: MarkerId('gaza'), position: gazaLocation));
          },
        ),
      );
    });
  }
}
