import 'package:flutter/material.dart';
import 'package:recycling_app/core/utils/app_exports/app_export.dart';

class InfoCategories extends StatefulWidget {
  const InfoCategories({super.key, required this.categoryModel});

  static const String routeName = '/info-categories';
  final CategoryModel categoryModel;

  @override
  State<InfoCategories> createState() => _InfoCategoriesState();
}

class _InfoCategoriesState extends State<InfoCategories> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final newPage = _pageController.page?.round() ?? 0;
      if (newPage != _currentPage) {
        setState(() {
          _currentPage = newPage;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoryModel = widget.categoryModel;
    final totalPages = categoryModel.description.commonItems.length + 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryModel.title,
          style: AppTextStyle.nunitoSemiBold.copyWith(fontSize: 30.sp),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: totalPages,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  30.verticalSpace,
                  Image.asset(
                    index == 0
                        ? categoryModel.imagePath
                        : categoryModel
                            .description.commonItems[index - 1].imagePath,
                    height: 150.h,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 35.h),
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: getBorderRadius(index, totalPages),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: index == 0
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.center,
                          children: [
                            35.verticalSpace,
                            if (index == 0) ...[
                              Text(
                                "YES:",
                                style: AppTextStyle.seoulNamsanRegular
                                    .copyWith(
                                  fontSize: 24.sp,
                                  color: AppColors.c70B458,
                                ),
                              ),
                              16.verticalSpace,
                              ...categoryModel.description.yes.map(
                                (e) => Text(
                                  " • $e",
                                  style: AppTextStyle.seoulNamsanRegular
                                      .copyWith(fontSize: 24.sp),
                                ),
                              ),
                              29.verticalSpace,
                              Text(
                                "NO:",
                                style: AppTextStyle.seoulNamsanRegular
                                    .copyWith(
                                  fontSize: 24.sp,
                                  color: AppColors.cD63D3D,
                                ),
                              ),
                              16.verticalSpace,
                              ...categoryModel.description.no.map(
                                (e) => Text(
                                  " • $e",
                                  style: AppTextStyle.seoulNamsanRegular
                                      .copyWith(fontSize: 24.sp),
                                ),
                              ),
                            ] else ...[
                              36.verticalSpace,
                              Text(
                                categoryModel.description
                                    .commonItems[index - 1].title,
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              16.verticalSpace,
                              Container(
                                width: 54.w,
                                height: 10.h,
                                decoration: BoxDecoration(
                                  color: AppColors.black,
                                  borderRadius:
                                      BorderRadius.circular(8.r),
                                ),
                              ),
                              28.verticalSpace,
                              ...categoryModel.description
                                  .commonItems[index - 1].subtitles
                                  .map(
                                (subtitle) => Text(
                                  subtitle,
                                  style: AppTextStyle.seoulNamsanRegular
                                      .copyWith(
                                    fontSize: 24.sp,
                                    color:
                                        AppColors.black.withOpacity(.6),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 16.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                totalPages,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  width: 9.w,
                  height: 9.h,
                  decoration: BoxDecoration(
                      color: _currentPage == index
                          ? AppColors.c8DD0DD
                          : AppColors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(width: 1.w, color: AppColors.c1A441D)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BorderRadius getBorderRadius(int index, int totalCount) {
    if (index == 0) {
      return BorderRadius.only(topLeft: Radius.circular(45.r));
    } else if (index == totalCount - 1) {
      return BorderRadius.only(topRight: Radius.circular(45.r));
    } else {
      return BorderRadius.zero;
    }
  }
}
