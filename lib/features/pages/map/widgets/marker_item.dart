import 'package:flutter/material.dart';
import 'package:recycling_app/core/utils/app_exports/app_export.dart';

class RecyclingModal extends StatefulWidget {
  const RecyclingModal({super.key, required this.markerModel});

  final MarkersModel markerModel;

  @override
  State<RecyclingModal> createState() => _RecyclingModalState();
}

class _RecyclingModalState extends State<RecyclingModal> {
  MainAxisSize mainAxisSize = MainAxisSize.min;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(33.r)),
              color: AppColors.c70B458.withOpacity(.64),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          margin: EdgeInsets.only(top: 24.h),
          // to show green shadow
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Column(
            mainAxisSize: mainAxisSize,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      AppRouter.router.pop();
                    },
                    icon: Image.asset(
                      AppImages.close,
                      height: 25.h,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (mainAxisSize == MainAxisSize.min) {
                        setState(() {
                          mainAxisSize = MainAxisSize.max;
                        });
                      } else {
                        setState(() {
                          mainAxisSize = MainAxisSize.min;
                        });
                      }
                    },
                    icon: Image.asset(
                      AppImages.openFull,
                      height: 33.h,
                    ),
                  ),
                ],
              ),
              17.verticalSpace,
              Text(
                widget.markerModel.title,
                style: AppTextStyle.seoulNamsanRegular.copyWith(
                  fontSize: 36.sp,
                  color: AppColors.c1A441D,
                ),
              ),
              Text(
                widget.markerModel.locationName,
                style: AppTextStyle.seoulNamsanRegular.copyWith(
                  fontSize: 18.sp,
                  color: AppColors.c1A441D,
                ),
                textAlign: TextAlign.center,
              ),
              2.verticalSpace,
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(AppImages.trashBox),
              ),
              22.verticalSpace,
              Text(
                "Recycle Categories",
                style: AppTextStyle.seoulNamsanRegular.copyWith(
                  fontSize: 34.sp,
                  color: AppColors.c1A441D,
                ),
              ),
              8.verticalSpace,
              Divider(color: AppColors.cC6E5BA),
              ...List.generate(
                widget.markerModel.recycleCategories.length,
                (index) => Text(
                  widget.markerModel.recycleCategories[index],
                  style: AppTextStyle.seoulNamsanRegular
                      .copyWith(fontSize: 20.sp, color: AppColors.c1A441D),
                ),
              ),
              40.verticalSpace,
              Text(
                "Instructions:",
                style: AppTextStyle.seoulNamsanRegular.copyWith(
                  fontSize: 34.sp,
                  color: AppColors.c1A441D,
                ),
              ),
              Divider(color: AppColors.cC6E5BA),
            ],
          ),
        ),
      ],
    );
  }
}
