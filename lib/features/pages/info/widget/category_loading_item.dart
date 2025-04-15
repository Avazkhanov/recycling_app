import 'package:flutter/material.dart';
import 'package:recycling_app/core/utils/app_exports/app_export.dart';
import 'package:recycling_app/features/global_widgets/custom_loading_item.dart';

class CategoryLoadingItem extends StatelessWidget {
  const CategoryLoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmerEffect(
      isLoading: true,
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                30.horizontalSpace,
                ...List.generate(4, (_) => _buildCategoryItem()),
              ],
            ),
          ),
          21.verticalSpace,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                30.horizontalSpace,
                ...List.generate(4, (_) => _buildCategoryItem()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem() {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      padding: EdgeInsets.fromLTRB(28.w, 19.25.h, 28.w, 22.h),
      decoration: BoxDecoration(
        color: AppColors.c70B458,
        borderRadius: BorderRadius.circular(33.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(.25),
            offset: Offset(0, 4.sp),
            blurRadius: 4.sp,
            spreadRadius: 3.sp,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            " category.title",
            style: AppTextStyle.seoulNamsanRegular.copyWith(
              fontSize: 20.sp,
              color: AppColors.white,
            ),
          ),
          Container(
            height: 97.h,
            width: 97.w,
            color: AppColors.white,
          ),
        ],
      ),
    );
  }
}
