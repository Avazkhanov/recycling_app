import 'package:flutter/material.dart';
import 'package:recycling_app/core/utils/app_exports/app_export.dart';

import '../bloc/faq_bloc.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  static const String routeName = '/faq';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FaqBloc()..add(LoadFaqData()),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(45.r)),
          ),
          centerTitle: true,
          title: Text(
            "FORUM",
            style: AppTextStyle.nunitoSemiBold.copyWith(fontSize: 30.sp),
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<FaqBloc, FaqState>(
            builder: (context, state) {
              if (state.faqModel == null) {
                return const Center(child: CircularProgressIndicator());
              }

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'FAQs:',
                      style: AppTextStyle.seoulNamsanRegular.copyWith(
                        fontSize: 30.sp,
                      ),
                    ),
                    8.verticalSpace,
                    Container(
                      padding: EdgeInsets.all(22.sp),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(38.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(.25),
                            blurRadius: 4.sp,
                            offset: Offset(0, 4.sp),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...state.faqModel!.faqs.map(
                            (faq) => Padding(
                              padding: EdgeInsets.only(
                                bottom: 4.sp,
                              ),
                              child: Text(
                                "• $faq",
                                style: AppTextStyle.seoulNamsanRegular.copyWith(
                                    fontSize: 18.sp, color: AppColors.c1A441D),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    30.verticalSpace,
                    Text(
                      'QUICK TIPS & TRICKS:',
                      style: AppTextStyle.seoulNamsanRegular.copyWith(
                        fontSize: 30.sp,
                      ),
                    ),
                    13.verticalSpace,
                    Container(
                      padding: EdgeInsets.all(22.sp),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(38.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(.25),
                            blurRadius: 4.sp,
                            offset: Offset(0, 4.sp),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...state.faqModel!.quickTips.map(
                            (faq) => Padding(
                              padding: EdgeInsets.only(
                                bottom: 4.sp,
                              ),
                              child: Text(
                                "• $faq",
                                style: AppTextStyle.seoulNamsanRegular.copyWith(
                                    fontSize: 18.sp, color: AppColors.c1A441D),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
