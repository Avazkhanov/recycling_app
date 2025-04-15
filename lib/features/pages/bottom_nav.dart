import 'package:flutter/material.dart';
import 'package:recycling_app/core/utils/app_exports/app_export.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key, required this.statefulShellBranch});

  final StatefulNavigationShell statefulShellBranch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: statefulShellBranch,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: statefulShellBranch.currentIndex,
        onTap: (index) {
          statefulShellBranch.goBranch(index);

        },
        backgroundColor: AppColors.c8DD0DD,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: List.generate(
          4,
          (index) => _barItem(
            icon: [
              AppIcons.infoIcon,
              AppIcons.locationIcon,
              AppIcons.scannerIcon,
              AppIcons.faqIcon
            ][index],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _barItem({required String icon}) =>
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          icon,
          height: 44.h,
        ),
        activeIcon: SvgPicture.asset(
          icon,
          height: 44.h,
          colorFilter: const ColorFilter.mode(
            AppColors.white,
            BlendMode.srcIn,
          ),
        ),
        label: "",
      );
}
