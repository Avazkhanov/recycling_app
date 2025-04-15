import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkersModel extends Equatable {
  final LatLng latLng;
  final String title;
  final String locationName;
  final List<String> recycleCategories;

  const MarkersModel({
    required this.latLng,
    required this.title,
    required this.locationName,
    required this.recycleCategories,
  });

  factory MarkersModel.fromJson(Map<String, dynamic> json) {
    return MarkersModel(
      latLng: json["latLng"] ?? const LatLng(0, 0),
      title: json['title'] ?? '',
      locationName: json['locationName'] ?? '',
      recycleCategories: List<String>.from(json['recycleCategories'] ?? []),
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'locationName': locationName,
    'recycleCategories': recycleCategories,
  };

  MarkersModel copyWith({
    LatLng? latLng,
    String? title,
    String? locationName,
    List<String>? recycleCategories,
  }) {
    return MarkersModel(
      latLng: latLng ?? this.latLng,
      title: title ?? this.title,
      locationName: locationName ?? this.locationName,
      recycleCategories: recycleCategories ?? this.recycleCategories,
    );
  }

  @override
  List<Object?> get props => [title, locationName, recycleCategories];
}
