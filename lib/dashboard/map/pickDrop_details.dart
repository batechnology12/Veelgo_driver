import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veelgo/dashboard/map/reachedLocation1.dart';
import 'package:veelgo/modelClasses/Accept_booking_model.dart';

import '../../properties/common properties.dart';

class PickupDrop extends StatefulWidget {
  List<AcceptBookingData> acceptbookingdata = [];
  
  PickupDrop({super.key, required this.acceptbookingdata});
  @override
  State<PickupDrop> createState() => _PickupDropState();
}

class _PickupDropState extends State<PickupDrop> {
  late GoogleMapController _controller;
  final Set<Marker> _markers = {};
  late LocationData _currentPosition;
  Location location = Location();

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(37.7749, -122.4194), // San Francisco
    zoom: 12,
  );

  @override
  void initState() {
    super.initState();
    // _getLocationAndSend();
  }

  // void _getLocationAndSend() async {
  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;

  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }

  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }

  //   _currentPosition = await location.getLocation();
  //   _sendLocation(_currentPosition.latitude!, _currentPosition.longitude!);
  // }

  // void _sendLocation(double latitude, double longitude) async {
  //   var url = Uri.parse(
  //       'https://veelgo.digitaldatatechnologia.in/api/update_location');
  //   var body = jsonEncode({
  //     "latitude": _currentPosition.latitude,
  //     "longitude": _currentPosition.longitude,
  //   });

  //   try {
  //     final prefs = await SharedPreferences.getInstance();
  //     String? authtoken = prefs.getString("auth_token");
  //     var response = await http.post(
  //       url,
  //       headers: <String, String>{
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $authtoken',
  //       },
  //       body: body,
  //     );

  //     if (response.statusCode == 200) {
  //       var jsonResponse = jsonDecode(response.body);
  //       print(jsonResponse);
  //       print('---------------------------------------');
  //       print('Response: $jsonResponse');

  //       SnackbarUtils.showSnackbar(context, 'Location updated successfully');
  //     } else {
  //       print('Request failed with status: ${response.statusCode}.');
  //       SnackbarUtils.showSnackbar(context, 'Failed to update location');
  //     }
  //   } catch (e) {
  //     print('Error sending location: $e');
  //     SnackbarUtils.showSnackbar(context, e.toString());
  //   }

  //   // Update markers on map
  //   setState(() {
  //     _markers.clear();
  //     _markers.add(Marker(
  //       markerId: MarkerId('currentLocation'),
  //       position: LatLng(latitude, longitude),
  //       infoWindow: InfoWindow(title: 'Your Location'),
  //     ));
  //   });

  //   // Move camera to updated location
  //   _controller.animateCamera(CameraUpdate.newCameraPosition(
  //     CameraPosition(
  //       target: LatLng(latitude, longitude),
  //       zoom: 14.0,
  //     ),
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey, // Replace with your color
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Container(
              height: size.height,
              width: size.width,
              child: GoogleMap(
                initialCameraPosition: _initialPosition,
                markers: _markers,
                myLocationEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  _controller = controller;
                },
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.3,
            maxChildSize: 0.7,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Replace with your color
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  border: Border.all(width: 1, color: Colors.grey.shade500),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller: scrollController,
                          children: [
                            LocationOne(
                              acceptbookingdata: widget.acceptbookingdata,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
