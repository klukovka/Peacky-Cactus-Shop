import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'main_page_item_type.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: MainMenuItemType.values.map((item) => item.route).toList(),
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: FadeTransition(
            opacity: animation,
            child: child,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: MainMenuItemType.values.map((item) {
              return BottomNavigationBarItem(
                icon: Icon(item.iconData),
                label: item.label,
              );
            }).toList(),
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
          ),
        );
      },
    );
  }
}
