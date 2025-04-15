import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:recycling_app/core/utils/app_exports/app_export.dart';
import 'package:recycling_app/features/pages/info/model/category_description_model.dart';
import 'package:recycling_app/features/pages/info/model/common_items_model.dart';

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  InfoBloc() : super(const InfoState()) {
    on<LoadCategories>(_onLoadCategories);
    on<SearchCategory>(_onSearchCategory);
  }

  void _onSearchCategory(SearchCategory event, Emitter<InfoState> emit) {
    final query = event.query.toLowerCase();
    if (query.isEmpty) {
      emit(state.copyWith(
        searchResults: const [],
      ));
      return;
    }

    final results = state.categories
        .where((category) => category.title.toLowerCase().contains(query))
        .toList();

    emit(state.copyWith(
      searchResults: results,
    ));
  }

  Future<void> _onLoadCategories(
      LoadCategories event, Emitter<InfoState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final categories = [
        const CategoryModel(
          title: "PLASTIC",
          imagePath: AppImages.bottle,
          description: CategoryDescriptionModel(yes: [
            "Mixed Paper: advertisements, direct mail, office paper, stationary, emvelopes, paper bags, gift wrap",
            "Magazines, newspaper, catalogs, and telephone books"
          ], no: [
            "Disposable diapers or rags",
            "soiled items such as pizza boxes, napkins, and tissue",
            "soiled items such as pizza boxes, napkins, and tissue",
            "soiled items such as pizza boxes, napkins, and tissue",
            "soiled items such as pizza boxes, napkins, and tissue",
            "soiled items such as pizza boxes, napkins, and tissue",
            "soiled items such as pizza boxes, napkins, and tissue",
            "soiled items such as pizza boxes, napkins, and tissue",
          ], commonItems: [
            CommonItemsModel(
              imagePath: AppImages.recycling,
              title: "POLYETHYLENE \nTEREPHTHALATE\nCOMMON ITEMS: ",
              subtitles: [
                "Cosmetic Containers",
                "Plastic Bottles",
                "Mouthwash Bottles",
                "Prepared Food Trays",
              ],
            ),
            CommonItemsModel(
              imagePath: AppImages.recycling,
              title: "POLYETHYLENE \nTEREPHTHALATE\nCOMMON ITEMS: ",
              subtitles: [
                "Cosmetic Containers",
                "Plastic Bottles",
                "Mouthwash Bottles",
                "Prepared Food Trays",
              ],
            ),
          ]),
        ),
        const CategoryModel(
          title: "METAL",
          imagePath: AppImages.metal,
          description: CategoryDescriptionModel(yes: [
            "Mixed Paper: advertisements, direct mail, office paper, stationary, emvelopes, paper bags, gift wrap",
            "Magazines, newspaper, catalogs, and telephone books"
          ], no: [
            "Disposable diapers or rags",
            "soiled items such as pizza boxes, napkins, and tissue",
          ], commonItems: [
            CommonItemsModel(
              imagePath: AppImages.recycling,
              title: "POLYETHYLENE \nTEREPHTHALATE\nCOMMON ITEMS: ",
              subtitles: [
                "Cosmetic Containers",
                "Plastic Bottles",
                "Mouthwash Bottles",
                "Prepared Food Trays",
              ],
            ),
          ]),
        ),
        const CategoryModel(
          title: "CARDBOARD",
          imagePath: AppImages.box,
          description: CategoryDescriptionModel(yes: [
            "Mixed Paper: advertisements, direct mail, office paper, stationary, emvelopes, paper bags, gift wrap",
            "Magazines, newspaper, catalogs, and telephone books"
          ], no: [
            "Disposable diapers or rags",
            "soiled items such as pizza boxes, napkins, and tissue",
          ], commonItems: [
            CommonItemsModel(
              imagePath: AppImages.recycling,
              title: "POLYETHYLENE \nTEREPHTHALATE\nCOMMON ITEMS: ",
              subtitles: [
                "Cosmetic Containers",
                "Plastic Bottles",
                "Mouthwash Bottles",
                "Prepared Food Trays",
              ],
            )
          ]),
        ),
        const CategoryModel(
          title: "BATTERY",
          imagePath: AppImages.battery,
          description: CategoryDescriptionModel(yes: [
            "Mixed Paper: advertisements, direct mail, office paper, stationary, emvelopes, paper bags, gift wrap",
            "Magazines, newspaper, catalogs, and telephone books"
          ], no: [
            "Disposable diapers or rags",
            "soiled items such as pizza boxes, napkins, and tissue",
          ], commonItems: [
            CommonItemsModel(
              imagePath: AppImages.recycling,
              title: "POLYETHYLENE \nTEREPHTHALATE\nCOMMON ITEMS: ",
              subtitles: [
                "Cosmetic Containers",
                "Plastic Bottles",
                "Mouthwash Bottles",
                "Prepared Food Trays",
              ],
            )
          ]),
        ),
        const CategoryModel(
          title: "PAPER",
          imagePath: AppImages.paper,
          description: CategoryDescriptionModel(yes: [
            "Mixed Paper: advertisements, direct mail, office paper, stationary, emvelopes, paper bags, gift wrap",
            "Magazines, newspaper, catalogs, and telephone books"
          ], no: [
            "Disposable diapers or rags",
            "soiled items such as pizza boxes, napkins, and tissue",
          ], commonItems: [
            CommonItemsModel(
              imagePath: AppImages.recycling,
              title: "POLYETHYLENE \nTEREPHTHALATE\nCOMMON ITEMS: ",
              subtitles: [
                "Cosmetic Containers",
                "Plastic Bottles",
                "Mouthwash Bottles",
                "Prepared Food Trays",
              ],
            )
          ]),
        ),
        const CategoryModel(
          title: "GLASS",
          imagePath: AppImages.glass,
          description: CategoryDescriptionModel(yes: [
            "Mixed Paper: advertisements, direct mail, office paper, stationary, emvelopes, paper bags, gift wrap",
            "Magazines, newspaper, catalogs, and telephone books"
          ], no: [
            "Disposable diapers or rags",
            "soiled items such as pizza boxes, napkins, and tissue",
          ], commonItems: [
            CommonItemsModel(
              imagePath: AppImages.recycling,
              title: "POLYETHYLENE \nTEREPHTHALATE\nCOMMON ITEMS: ",
              subtitles: [
                "Cosmetic Containers",
                "Plastic Bottles",
                "Mouthwash Bottles",
                "Prepared Food Trays",
              ],
            )
          ]),
        ),
        const CategoryModel(
          title: "Electric",
          imagePath: AppImages.electric,
          description: CategoryDescriptionModel(yes: [
            "Mixed Paper: advertisements, direct mail, office paper, stationary, emvelopes, paper bags, gift wrap",
            "Magazines, newspaper, catalogs, and telephone books"
          ], no: [
            "Disposable diapers or rags",
            "soiled items such as pizza boxes, napkins, and tissue",
          ], commonItems: [
            CommonItemsModel(
              imagePath: AppImages.recycling,
              title: "POLYETHYLENE \nTEREPHTHALATE\nCOMMON ITEMS: ",
              subtitles: [
                "Cosmetic Containers",
                "Plastic Bottles",
                "Mouthwash Bottles",
                "Prepared Food Trays",
              ],
            )
          ]),
        ),
        const CategoryModel(
          title: "ORGANIC",
          imagePath: AppImages.organic,
          description: CategoryDescriptionModel(yes: [
            "Mixed Paper: advertisements, direct mail, office paper, stationary, emvelopes, paper bags, gift wrap",
            "Magazines, newspaper, catalogs, and telephone books"
          ], no: [
            "Disposable diapers or rags",
            "soiled items such as pizza boxes, napkins, and tissue",
          ], commonItems: [
            CommonItemsModel(
              imagePath: AppImages.recycling,
              title: "POLYETHYLENE \nTEREPHTHALATE\nCOMMON ITEMS: ",
              subtitles: [
                "Cosmetic Containers",
                "Plastic Bottles",
                "Mouthwash Bottles",
                "Prepared Food Trays",
              ],
            )
          ]),
        ),
      ];
      emit(state.copyWith(status: FormStatus.success, categories: categories));
    } catch (e) {
      emit(
          state.copyWith(status: FormStatus.error, errorMessage: e.toString()));
    }
  }
}
