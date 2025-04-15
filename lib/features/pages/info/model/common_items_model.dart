import 'package:equatable/equatable.dart';

class CommonItemsModel extends Equatable {
  final String imagePath;
  final String title;
  final List<String> subtitles;

  const CommonItemsModel({
    required this.imagePath,
    required this.title,
    required this.subtitles,
  });

  factory CommonItemsModel.fromJson(Map<String, dynamic> json) {
    return CommonItemsModel(
      imagePath: json["imagePath"] ?? "",
      title: json["title"] ?? "",
      subtitles: json['subtitles'] ?? [],
    );
  }

  @override
  List<Object?> get props => [imagePath, title, subtitles];
}
