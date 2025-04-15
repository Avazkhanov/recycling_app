import 'package:equatable/equatable.dart';
import 'package:recycling_app/features/pages/info/model/common_items_model.dart';

class CategoryDescriptionModel extends Equatable {
  final List<String> yes;
  final List<String> no;
  final List<CommonItemsModel> commonItems;

  const CategoryDescriptionModel({
    required this.yes,
    required this.no,
    required this.commonItems,
  });

  factory CategoryDescriptionModel.fromJson(Map<String, dynamic> json) {
    return CategoryDescriptionModel(
      yes: json["yes"] ?? [],
      no: json['no'] ?? [],
      commonItems: (json['commonItems'] as List?)
              ?.map((e) => CommonItemsModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'yes': yes,
      'no': no,
      'commonItems': commonItems,
    };
  }

  @override
  List<Object?> get props => [yes, no, commonItems];
}
