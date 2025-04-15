import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationService {
  final Location _location = Location();

  Future<bool> checkLocationPermission() async {
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return false;
      }
    }

    PermissionStatus permissionStatus = await _location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await _location.requestPermission();
      if (permissionStatus == PermissionStatus.denied) {
        return false;
      }
    }

    if (permissionStatus == PermissionStatus.deniedForever) {
      return false;
    }
    await _location.changeSettings(
      accuracy: LocationAccuracy.navigation,
      interval: 500,
    );

    return true;
  }

  Future<LatLng?> getCurrentLocation() async {
    try {
      LocationData locationData = await _location.getLocation();
      return LatLng(locationData.latitude!, locationData.longitude!);
    } catch (e) {
      return null;
    }
  }

  Stream<LatLng> get locationStream {
    return _location.onLocationChanged.map(
      (locationData) => LatLng(
        locationData.latitude!,
        locationData.longitude!,
      ),
    );
  }
}
