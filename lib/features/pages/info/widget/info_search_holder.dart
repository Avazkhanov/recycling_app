import 'package:flutter/material.dart';
import 'package:recycling_app/core/utils/app_exports/app_export.dart';

class InfoSearchHolder extends StatefulWidget {
  const InfoSearchHolder({super.key});

  @override
  State<InfoSearchHolder> createState() => _InfoSearchHolderState();
}

class _InfoSearchHolderState extends State<InfoSearchHolder> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _PersistentBuilder(_controller),
    );
  }
}

class _PersistentBuilder extends SliverPersistentHeaderDelegate {
  final TextEditingController controller;

  _PersistentBuilder(this.controller);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.cC6E5BA,
      child: Column(
        children: [
          5.verticalSpace,
          GlobalTextField(
            textEditingController: controller,
            hintText: "EX) MILK BOTTLE",
            hintTextStyle: AppTextStyle.seoulNamsanRegular.copyWith(
              fontSize: 22.sp,
              color: AppColors.cB5BDC2,
            ),
            onTap: () {
              context
                  .read<InfoBloc>()
                  .add(SearchCategory(query: controller.text));
            },
            onTapClearButton: () {
              controller.clear();
              context.read<InfoBloc>().add(SearchCategory(query: ""));
            },
          ),
          5.verticalSpace
        ],
      ),
    );
  }

  @override
  double get maxExtent => 80.sp;

  @override
  double get minExtent => 80.sp;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
