// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'navigation.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BottomNavigationBarRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BottomNavigationBarScreen(),
      );
    },
    CalculatorRouteWrapper.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CalculatorScreenWrapper(),
      );
    },
    HistoryRouteWrapper.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HistoryScreenWrapper(),
      );
    },
  };
}

/// generated route for
/// [BottomNavigationBarScreen]
class BottomNavigationBarRoute extends PageRouteInfo<void> {
  const BottomNavigationBarRoute({List<PageRouteInfo>? children})
      : super(
          BottomNavigationBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavigationBarRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CalculatorScreenWrapper]
class CalculatorRouteWrapper extends PageRouteInfo<void> {
  const CalculatorRouteWrapper({List<PageRouteInfo>? children})
      : super(
          CalculatorRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'CalculatorRouteWrapper';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HistoryScreenWrapper]
class HistoryRouteWrapper extends PageRouteInfo<void> {
  const HistoryRouteWrapper({List<PageRouteInfo>? children})
      : super(
          HistoryRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRouteWrapper';

  static const PageInfo<void> page = PageInfo<void>(name);
}
