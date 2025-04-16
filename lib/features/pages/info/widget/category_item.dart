import 'package:flutter/material.dart';
import 'package:recycling_app/core/utils/app_exports/app_export.dart';
import 'package:recycling_app/features/pages/info/widget/category_loading_item.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  Widget _buildCategoryItem(CategoryModel category) {
    return InkWell(
      onTap: (){
        AppRouter.router.push(InfoCategories.routeName,extra: category);
      },
      borderRadius: BorderRadius.circular(33.r),
      child: Container(
        margin: EdgeInsets.only(right: 10.w, bottom: 10.h),
        padding: EdgeInsets.fromLTRB(28.w, 19.25.h, 28.w, 22.h),
        decoration: BoxDecoration(
          color: AppColors.c70B458,
          borderRadius: BorderRadius.circular(33.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(.25),
              offset: Offset(0, 4.sp),
              blurRadius: 4.sp,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              category.title,
              style: AppTextStyle.seoulNamsanRegular.copyWith(
                fontSize: 20.sp,
                color: AppColors.white,
              ),
            ),
            Hero(
              tag: category.title,
              child: Image.asset(
                category.imagePath,
                height: 97.h,
                width: 97.w,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<InfoBloc, InfoState>(
        builder: (context, state) {
          if (state.status.isLoading && state.categories.isEmpty) {
            return const CategoryLoadingItem();
          }

          final displayCategories = state.searchResults.isNotEmpty
              ? state.searchResults
              : state.categories;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < displayCategories.length; i += 4) ...[                
                if (i > 0) 21.verticalSpace,
                Animate(
                  effects: [
                    SlideEffect(
                      begin: const Offset(1, 0),
                      end: const Offset(0, 0),
                      duration: 500.ms,
                      curve: Curves.linear,
                      delay: (i ~/ 4 * 200).ms,
                    )
                  ],
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        30.horizontalSpace,
                        ...displayCategories
                            .skip(i)
                            .take(4)
                            .map(_buildCategoryItem),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
