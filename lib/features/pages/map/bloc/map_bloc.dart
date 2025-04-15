import 'dart:async';
import 'dart:math';

import 'package:recycling_app/core/services/location_service.dart';
import 'package:recycling_app/core/utils/app_exports/app_export.dart';
import 'package:recycling_app/core/utils/app_secret/app_secret.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final LocationService _locationService = LocationService();
  StreamSubscription<LatLng>? _locationSubscription;
  GoogleMapController? _mapController;

  MapBloc() : super(MapState()) {
    on<LoadUserLocation>(_onLoadUserLocation);
    on<UpdateUserLocation>(_onUpdateUserLocation);
    on<GenerateNearbyMarkers>(_onGenerateNearbyMarkers);
    on<DrawPolylineToNearestMarker>(_onDrawPolylineToNearestMarker);
    on<MoveCamera>(_onMoveCamera);

  }

  void setMapController(GoogleMapController controller) {
    _mapController = controller;
  }

  Future<void> _onMoveCamera(MoveCamera event, Emitter<MapState> emit) async {
    if (_mapController != null) {
      await _mapController!.animateCamera(
        CameraUpdate.newLatLng(event.location),
      );
    }
  }


  Future<void> _onLoadUserLocation(
      LoadUserLocation event, Emitter<MapState> emit) async {
    try {
      bool hasPermission = await _locationService.checkLocationPermission();
      if (!hasPermission) {
        emit(state.copyWith(
          userLocationStatus: FormStatus.error,
          errorMessage: 'Location permissions are required',
        ));
        return;
      }
      emit(state.copyWith(userLocationStatus: FormStatus.loading));
      final userLocation = await _locationService.getCurrentLocation();
      if (userLocation == null) {
        emit(state.copyWith(
          userLocationStatus: FormStatus.error,
          errorMessage: 'Failed to get location',
        ));
        return;
      }

      _locationSubscription?.cancel();
      _locationSubscription = _locationService.locationStream.listen(
        (location) {
          add(UpdateUserLocation(location));
        },
      );
      add(MoveCamera(userLocation));
      emit(state.copyWith(
        userLocationStatus: FormStatus.success,
        userLocation: userLocation,
      ));
      add(GenerateNearbyMarkers(userLocation));
    } catch (e) {
      emit(state.copyWith(
        userLocationStatus: FormStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onUpdateUserLocation(UpdateUserLocation event, Emitter<MapState> emit) {
    if (state.userLocationStatus == FormStatus.success) {
      emit(state.copyWith(userLocation: event.location));
    }
  }

  void _onGenerateNearbyMarkers(
      GenerateNearbyMarkers event, Emitter<MapState> emit) {
    if (state.userLocationStatus == FormStatus.success) {
      emit(state.copyWith(
        userLocation: event.center,
      ));
      final random = Random();
      List<MarkersModel> markers = [];
      for (int i = 0; i < 5; i++) {
        final lat = event.center.latitude + (random.nextDouble() - 0.5) * 0.01;
        final lng = event.center.longitude + (random.nextDouble() - 0.5) * 0.01;
        markers.add(
          MarkersModel(
            latLng: LatLng(lat, lng),
            title: "Recycling Centre $i",
            locationName: " $i xxx Street, State College, PA",
            recycleCategories: const [
              "Cardboard",
              "Mixed Paper",
              "Plastic",
            ],
          ),
        );
      }

      emit(state.copyWith(markers: markers));
    }
  }

  Future<void> _onDrawPolylineToNearestMarker(
      DrawPolylineToNearestMarker event, Emitter<MapState> emit) async {
    if (state.userLocation == null || state.markers.isEmpty) {
      emit(state.copyWith(
        polyLineStatus: FormStatus.error,
        errorMessage: 'User location or markers not available',
      ));
      return;
    }
    emit(state.copyWith(polyLineStatus: FormStatus.loading));

    MarkersModel nearestMarker = state.markers.first;
    double minDistance = double.infinity;

    for (var marker in state.markers) {
      final distance = _calculateDistance(
        state.userLocation!.latitude,
        state.userLocation!.longitude,
        marker.latLng.latitude,
        marker.latLng.longitude,
      );

      if (distance < minDistance) {
        minDistance = distance;
        nearestMarker = marker;
      }
    }

    try {
      final polylinePoints = PolylinePoints();
      final result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey: AppSecret.googleMapApi,
        request: PolylineRequest(
          origin: PointLatLng(
              state.userLocation!.latitude, state.userLocation!.longitude),
          destination: PointLatLng(
              nearestMarker.latLng.latitude, nearestMarker.latLng.longitude),
          mode: TravelMode.walking,
        ),
      );

      if (result.points.isNotEmpty) {
        final List<LatLng> polylineCoordinates = result.points
            .map((point) => LatLng(point.latitude, point.longitude))
            .toList();

        const polylineId = PolylineId('nearest_marker');
        final polyline = Polyline(
          polylineId: polylineId,
          color: AppColors.c70B458,
          width: 3,
          points: polylineCoordinates,
        );

        emit(state.copyWith(
          polyLines: {polyline},
          nearestMarker: nearestMarker,
          polyLineStatus: FormStatus.success
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        polyLineStatus: FormStatus.error,
        errorMessage: 'Failed to draw route: ${e.toString()}',
      ));
    }
  }

  double _calculateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371;
    final double dLat = _toRadians(lat2 - lat1);
    final double dLon = _toRadians(lon2 - lon1);
    final double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) *
            cos(_toRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  double _toRadians(double degree) {
    return degree * pi / 180;
  }

  @override
  Future<void> close() {
    _locationSubscription?.cancel();
    return super.close();
  }
}
