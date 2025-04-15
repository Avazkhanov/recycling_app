import 'package:flutter/material.dart';
import 'package:recycling_app/core/utils/app_exports/app_export.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,_){
        return MaterialApp.router(
          title: "Recycling App",
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.cC6E5BA
          ),
        );
      },
    );
  }
}
