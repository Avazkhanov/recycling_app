import 'package:flutter/material.dart';
import 'package:recycling_app/core/utils/app_exports/app_export.dart';
import 'package:recycling_app/features/pages/info/widget/category_item.dart';
import 'package:recycling_app/features/pages/info/widget/info_search_holder.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  static const String routeName = '/info';

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(45.r))),
        centerTitle: true,
        title: Text(
          "ITEM SEARCH",
          style: AppTextStyle.nunitoSemiBold.copyWith(fontSize: 30.sp),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.fromLTRB(41.w, 46.w, 0, 8.h),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "Search By Item:",
                  style:
                  AppTextStyle.seoulNamsanRegular.copyWith(fontSize: 24.sp),
                ),
              ),
            ),
            const InfoSearchHolder(),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(41.w, 15.w, 0, 13.h),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "Search By Category:",
                  style:
                  AppTextStyle.seoulNamsanRegular.copyWith(fontSize: 24.sp),
                ),
              ),
            ),
            const CategoryItem(),
          ],
        ),
      ),
    );
  }
}
