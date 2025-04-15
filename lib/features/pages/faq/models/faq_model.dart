import 'package:equatable/equatable.dart';

class FaqModel extends Equatable {
  final List<String> faqs;
  final List<String> quickTips;

  const FaqModel({
    required this.faqs,
    required this.quickTips,
  });

  FaqModel copyWith({
    List<String>? faqs,
    List<String>? quickTips,
  }) {
    return FaqModel(
      faqs: faqs ?? this.faqs,
      quickTips: quickTips ?? this.quickTips,
    );
  }

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(
      faqs: List<String>.from(json['faqs'] ?? []),
      quickTips: List<String>.from(json['quickTips'] ?? []),
    );
  }

  Map<String, dynamic> toJson() => {
        'faqs': faqs,
        'quickTips': quickTips,
      };

  @override
  List<Object?> get props => [faqs, quickTips];
}
