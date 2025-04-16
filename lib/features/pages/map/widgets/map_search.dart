import 'package:flutter/material.dart';
import 'package:recycling_app/core/utils/app_exports/app_export.dart';

class MapSearch extends StatefulWidget {
  const MapSearch({super.key});

  @override
  State<MapSearch> createState() => _MapSearchState();
}

class _MapSearchState extends State<MapSearch> {
  final TextEditingController textEditingController = TextEditingController();
  Size screenSize = Size.zero;

  @override
  void didChangeDependencies() {
    screenSize = MediaQuery.of(context).size;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: screenSize.height * .11.sp,
      left: 0,
      right: 0,
      child: GlobalTextField(
        hintText: "EX) STATE COLLEGE, PA",
        textEditingController: textEditingController,
        onChanged: (v) {
          setState(() {});
        },
        onTapClearButton: () {
          textEditingController.clear();
          setState(() {});
        },
      ),
    );
  }
}
