import 'package:flutter/material.dart';
import 'package:recycling_app/app/app.dart';
import 'package:recycling_app/core/utils/app_exports/packages.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}
