import 'package:flutter/material.dart';
import 'package:recycling_app/core/utils/app_exports/app_export.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    super.key,
    required this.title,
    this.onTap,
    this.borderRadius = 20,
    this.backGroundColor,
    this.titleColor,
    this.isLoading = false,
    this.width = double.infinity
  });

  final String title;
  final VoidCallback? onTap;
  final double borderRadius;
  final Color? backGroundColor;
  final Color? titleColor;
  final bool isLoading;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius),
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.all(13.sp),
        decoration: BoxDecoration(
            color: backGroundColor ?? AppColors.c70B458,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4.sp),
                  color: AppColors.black.withOpacity(.25),
                  blurRadius: 4.sp,
                  spreadRadius: 0)
            ]),
        child: isLoading?  Center(
          child: CircularProgressIndicator(
            color: AppColors.c1A441D,
          ),
        ) : Text(
          title,
          style: AppTextStyle.seoulNamsanRegular.copyWith(
            fontSize: 26.sp,
            color: titleColor ?? AppColors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
