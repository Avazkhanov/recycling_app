part of 'info_bloc.dart';

@immutable
sealed class InfoEvent {}

final class LoadCategories extends InfoEvent {}

final class SearchCategory extends InfoEvent {
  final String query;

  SearchCategory({required this.query});
}
