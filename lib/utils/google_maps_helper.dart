import 'package:flutter/material.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../service_locator.dart';
import 'function_response.dart';

class GoogleMapsHelper {
  final LatLng defaultGoogleMapsLocation = const LatLng(31.5116835, 74.3330131);

  FunctionResponse showPlacePicker(BuildContext context,
      {LatLng? initialPosition}) {
    FunctionResponse fResponse = getIt<FunctionResponse>();
    const apiKey = "AIzaSyDGVdifKHexYzYZjIF615HPm5e00AzqO4g";
    LatLng init = initialPosition ?? LatLng(31.5116835, 74.3330131);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlacePicker(
          apiKey: apiKey,
          onPlacePicked: (result) {
            print('AAAAAAA :${result.formattedAddress}');
            print(result.geometry?.location.lat);
            print(result.geometry?.location.lat);
            fResponse.data = result;
            fResponse.passed(message: 'got location');
            Navigator.of(context).pop();
          },
          initialPosition: init,
          useCurrentLocation: true,
        ),
      ),
    );
    return fResponse;
  }

  Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      print('Could not open the map.');
    }
  }
}
