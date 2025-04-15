part of 'faq_bloc.dart';

class FaqState extends Equatable {
  final FormStatus status;
  final FaqModel? faqModel;
  final String errorMessage;

  const FaqState({
    this.status = FormStatus.idle,
    this.faqModel,
    this.errorMessage = "",
  });

  FaqState copyWith({
    FormStatus? status,
    FaqModel? faqModel,
    String? errorMessage,
  }) {
    return FaqState(
      status: status ?? this.status,
      faqModel: faqModel ?? this.faqModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, faqModel, errorMessage];
}
