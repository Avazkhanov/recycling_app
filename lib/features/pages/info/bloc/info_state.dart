part of 'info_bloc.dart';

class InfoState extends Equatable {
  final FormStatus status;
  final List<CategoryModel> categories;
  final List<CategoryModel> searchResults;
  final String errorMessage;

  const InfoState({
    this.status = FormStatus.idle,
    this.categories = const [],
    this.searchResults = const [],
    this.errorMessage = "",
  });

  InfoState copyWith({
    FormStatus? status,
    List<CategoryModel>? categories,
    List<CategoryModel>? searchResults,
    String? errorMessage,
  }) {
    return InfoState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      searchResults: searchResults ?? this.searchResults,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [status, categories, searchResults, errorMessage];
}
