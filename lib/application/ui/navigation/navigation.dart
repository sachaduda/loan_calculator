import 'package:auto_route/auto_route.dart';
import 'package:loan_calculator/application/ui/navigation/screen_factory.dart';
import 'package:loan_calculator/application/ui/screens/bottom_navigation_bar_screen.dart';

part 'navigation.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  AppRouter();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: BottomNavigationBarRoute.page,
          initial: true,
          children: [
            AutoRoute(page: CalculatorRouteWrapper.page, initial: true),
            AutoRoute(page: HistoryRouteWrapper.page),
          ],
        ),
      ];
}
