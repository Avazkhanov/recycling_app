import 'package:flutter/material.dart';
import 'package:recycling_app/core/utils/app_exports/app_export.dart';

class GlobalTextField extends StatelessWidget {
  const GlobalTextField(
      {super.key,
      this.fillColor = AppColors.white,
      this.borderRadius = 36,
      this.borderWidth = 1,
      this.borderColor,
      required this.hintText,
      this.hintTextStyle,
      this.padding,
      required this.textEditingController,
      this.onChanged,
      this.onSubmitted,
      this.onTap,
      this.onTapClearButton});

  final Color fillColor;
  final double borderRadius;
  final double borderWidth;
  final Color? borderColor;
  final String hintText;
  final TextStyle? hintTextStyle;
  final EdgeInsets? padding;
  final TextEditingController textEditingController;
  final Function(String query)? onChanged;
  final Function(String query)? onSubmitted;
  final VoidCallback? onTap;
  final VoidCallback? onTapClearButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(left: 36.w, right: 31.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TextField(
              controller: textEditingController,
              onTapOutside: (v) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              onSubmitted: onSubmitted,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: hintTextStyle,
                filled: true,
                fillColor: fillColor,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius.r),
                  borderSide: BorderSide(
                    width: borderWidth.sp,
                    color: borderColor ?? AppColors.c70B458,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius.r),
                  borderSide: BorderSide(
                    width: borderWidth.sp,
                    color: borderColor ?? AppColors.c70B458,
                  ),
                ),
                suffixIcon: textEditingController.text.isNotEmpty
                    ? IconButton(
                        onPressed: onTapClearButton ?? () {},
                        icon: const Icon(Icons.close),
                      )
                    : null,
              ),
            ),
          ),
          12.horizontalSpace,
          IconButton.filled(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                borderColor ?? AppColors.c70B458,
              ),
              shadowColor: const WidgetStatePropertyAll(AppColors.black),
              elevation: WidgetStatePropertyAll(
                5.sp,
              ),
            ),
            onPressed: onTap ?? () {},
            icon: RepaintBoundary(
              child: SvgPicture.asset(
                AppIcons.searchIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
