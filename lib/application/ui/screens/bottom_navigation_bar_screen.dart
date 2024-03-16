import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loan_calculator/application/ui/navigation/navigation.dart';

@RoutePage()
class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      lazyLoad: false,
      transitionBuilder: null,
      animationDuration: const Duration(milliseconds: 0),
      routes: const [
        CalculatorRouteWrapper(),
        HistoryRouteWrapper(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            unselectedFontSize: 12,
            selectedFontSize: 14,
            iconSize: 20,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            elevation: 0,
            useLegacyColorScheme: false,
            enableFeedback: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white10,
            currentIndex: tabsRouter.activeIndex,
            
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Рассчитать',
                icon: Icon(Icons.calculate_outlined),
              ),
              BottomNavigationBarItem(
                label: 'История',
                icon: Icon(Icons.history),
              ),
            ],
          ),
        );
      },
    );
  }
}
