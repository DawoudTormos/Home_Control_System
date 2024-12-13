
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '/pages/home.dart';
import '../pages/page_not_found.dart';

import 'platforms_routing_helper.dart' if (dart.library.html) './web_routing.dart' if (dart.library.io)  './other_routing.dart' ;




 void configureWebURL(){// to deal with web diffrenetly from other platforms regarding URLS
  configureWebURL_();
 }



 final Map<String, List<Map<String, dynamic>>> gridItems = {
  "Kitchen": [
    {"name": "Lamp 1", "color": Colors.red, "icon": Icons.lightbulb, "value": true},
    {"name": "Spotlight 1", "color": Colors.orange, "icon": Icons.light, "value": 0.86},
    {"name": "AC 2", "color": Colors.purple, "icon": Icons.ac_unit, "value": true},
    {"name": "Door Lock", "color": Colors.teal, "icon": Icons.lock_outlined, "value": true},
  ],
  "Living Room": [
    {"name": "Heater", "color": Colors.pink, "icon": Icons.air_rounded, "value": true},
    {"name": "Lamp 2", "color": Colors.green, "icon": Icons.lightbulb, "value": true},
    {"name": "Lamp 3", "color": Colors.blue, "icon": Icons.lightbulb, "value": true},
  ],
};

 final Map<String, List<Map<String, dynamic>>> gridItems2 = {
  "Kitchen2": [
    {"name": "Lamp 1", "color": Colors.red, "icon": Icons.lightbulb, "value": true},
    {"name": "Spotlight 1", "color": Colors.orange, "icon": Icons.light, "value": 0.86},
    {"name": "AC 2", "color": Colors.purple, "icon": Icons.ac_unit, "value": true},
    {"name": "Door Lock", "color": Colors.teal, "icon": Icons.lock_outlined, "value": true},
  ],
  "Living Room2": [
    {"name": "Heater", "color": Colors.pink, "icon": Icons.air_rounded, "value": true},
    {"name": "Lamp 2", "color": Colors.green, "icon": Icons.lightbulb, "value": true},
    {"name": "Lamp 3", "color": Colors.blue, "icon": Icons.lightbulb, "value": true},
  ],
};


   final List<String> gridItemsIndexes = ["Kitchen" , "Living Room"];
   final List<String> gridItemsIndexes2 = ["Kitchen2" , "Living Room2"];



class AppRouter extends RouterDelegate<AppState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppState> {
  final GlobalKey<NavigatorState> navigatorKey;

  AppState _currentState = AppState('/');

  AppRouter() : navigatorKey = GlobalKey<NavigatorState>();

  AppState get currentConfiguration => _currentState;

  @override
  Future<void> setNewRoutePath(AppState state) async {
    _currentState = state;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(child: Home( gridItems: gridItems , gridItemsIndexes : gridItemsIndexes), key: ValueKey('HomePage')),
        if (_currentState.path == '/page2')
          MaterialPage(child: Home( gridItems: gridItems2 , gridItemsIndexes : gridItemsIndexes2), key: const ValueKey('DetailsPage')),
        if (_currentState.path == '/page3')
          MaterialPage(child: Home( gridItems: gridItems2 , gridItemsIndexes : gridItemsIndexes2), key: const ValueKey('DetailsPage')),
          if (!['/', '/page2', '/page3'].contains(_currentState.path))  
          MaterialPage(child: NotFoundPage(), key: ValueKey('NotFoundPage')),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        // Handle back navigation
        _currentState = AppState('/');
        notifyListeners();
        return true;
      },
    );
  }

  static AppRouter of(BuildContext context) {
    return Router.of(context).routerDelegate as AppRouter;
  }
}



class AppRouteInformationParser extends RouteInformationParser<AppState> {
  @override
  Future<AppState> parseRouteInformation(RouteInformation routeInformation) {
    final uri = Uri.parse(routeInformation.location ?? '/');
    return SynchronousFuture(AppState(uri.path));
  }

  @override
  RouteInformation? restoreRouteInformation(AppState state) {
    return RouteInformation(location: state.path);
  }
}


class AppState {
  final String path;

  AppState(this.path);
}


