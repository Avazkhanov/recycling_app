import 'package:recycling_app/core/utils/app_exports/app_export.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: InfoScreen.routeName,
    routes: [
      StatefulShellRoute.indexedStack(
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: InfoScreen.routeName,
                builder: (context, state) {
                  return BlocProvider(
                      create: (_) => InfoBloc()..add(LoadCategories()),
                      child: const InfoScreen());
                },
              ),
              GoRoute(
                path: InfoCategories.routeName,
                builder: (context, state) {
                  return InfoCategories(
                      categoryModel: state.extra as CategoryModel);
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: MapScreen.routeName,
                builder: (context, state) {
                  return BlocProvider(
                    create: (context) => MapBloc()..add(LoadUserLocation()),
                    child: const MapScreen(),
                  );
                },
              )
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: QrCodeScreen.routeName,
                builder: (context, state) {
                  return BlocProvider(
                    create: (context) => ScanBloc(),
                    child: const QrCodeScreen(),
                  );
                },
              )
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: FaqScreen.routeName,
                builder: (context, state) {
                  return const FaqScreen();
                },
              )
            ],
          ),
        ],
        builder: (context, state, navigationShell) {
          return BottomNav(statefulShellBranch: navigationShell);
        },
      ),
    ],
  );
}
