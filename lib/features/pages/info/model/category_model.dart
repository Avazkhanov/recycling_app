import 'package:equatable/equatable.dart';

import 'category_description_model.dart';

class CategoryModel extends Equatable {
  final String title;
  final String imagePath;
  final CategoryDescriptionModel description;

  const CategoryModel({
    required this.title,
    required this.imagePath,
    required this.description,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      title: json['title'] as String,
      imagePath: json['imagePath'] as String,
      description: CategoryDescriptionModel.fromJson(json['description']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'imagePath': imagePath,
      'description': description.toJson(),
    };
  }

  @override
  List<Object?> get props => [title, imagePath, description];
}
