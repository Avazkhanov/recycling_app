part of 'map_bloc.dart';

class MapState {
  final FormStatus userLocationStatus;
  final FormStatus polyLineStatus;
  final LatLng? userLocation;
  final List<MarkersModel> markers;
  final String? errorMessage;
  final Set<Polyline>? polyLines;
  final MarkersModel? nearestMarker;

  MapState({
    this.userLocationStatus = FormStatus.idle,
    this.polyLineStatus = FormStatus.idle,
    this.userLocation,
    this.markers = const [],
    this.errorMessage,
    this.polyLines,
    this.nearestMarker,
  });

  MapState copyWith({
    FormStatus? userLocationStatus,
    FormStatus? polyLineStatus,
    LatLng? userLocation,
    List<MarkersModel>? markers,
    String? errorMessage,
    Set<Polyline>? polyLines,
    MarkersModel? nearestMarker,
  }) {
    return MapState(
      userLocationStatus: userLocationStatus ?? this.userLocationStatus,
      polyLineStatus: polyLineStatus ?? this.polyLineStatus,
      userLocation: userLocation ?? this.userLocation,
      markers: markers ?? this.markers,
      errorMessage: errorMessage ?? this.errorMessage,
      polyLines: polyLines ?? this.polyLines,
      nearestMarker: nearestMarker ?? this.nearestMarker,
    );
  }
}
