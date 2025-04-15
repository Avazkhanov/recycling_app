part of 'map_bloc.dart';

abstract class MapEvent {}

class LoadUserLocation extends MapEvent {}

class UpdateUserLocation extends MapEvent {
  final LatLng location;
  UpdateUserLocation(this.location);
}

class GenerateNearbyMarkers extends MapEvent {
  final LatLng center;
  GenerateNearbyMarkers(this.center);
}

class DrawPolylineToNearestMarker extends MapEvent {}

class MoveCamera extends MapEvent {
  final LatLng location;
  MoveCamera(this.location);
}
