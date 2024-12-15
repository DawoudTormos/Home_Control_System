import 'package:edittable_grid_flutter/pages/home.dart';
import 'package:edittable_grid_flutter/widgets/Grid_of_Gridviews/main_grid.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';





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
    {"name": "Lamp 1", "color":  Colors.deepOrange[400], "icon": Icons.lightbulb, "value": true},
    {"name": "Spotlight 1", "color": Colors.orange, "icon": Icons.light, "value": 0.86},
    {"name": "AC 2", "color": Colors.purple, "icon": Icons.ac_unit, "value": true},
    {"name": "Door Lock", "color": Colors.teal, "icon": Icons.lock_outlined, "value": true},
  ],
  "Living Room2": [
    {"name": "Heater", "color": Colors.red, "icon": Icons.air_rounded, "value": true},
    {"name": "Lamp 2", "color": Colors.deepOrange[400], "icon": Icons.lightbulb, "value": true},
    {"name": "Lamp 3", "color": Colors.deepOrange[400], "icon": Icons.lightbulb, "value": true},
  ],
};


   final List<String> gridItemsIndexes = ["Kitchen" , "Living Room"];
   final List<String> gridItemsIndexes2 = ["Kitchen2" , "Living Room2"];



class NavBar extends StatelessWidget {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  NavBar({super.key});

    List<Widget> screens = [
       Home(
              gridItems: gridItems, gridItemsIndexes: gridItemsIndexes), // Home
       Home(
              gridItems: gridItems2, gridItemsIndexes: gridItemsIndexes2), // Dashboard
       Home(
              gridItems: gridItems, gridItemsIndexes: gridItemsIndexes), // Device Manager
      Container(), // Logout
    ];

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.dashboard),
        title: "Dashboard",
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.devices),
        title: "Device \nManager",
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.logout),
        title: "Logout",
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: screens,
      items: _navBarItems(),
      //confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      navBarStyle: NavBarStyle.style1, // Style1
      onItemSelected : (index) {
  switch (index) {
    case 0:
      break;
    case 1:
      break;
    case 2:
      break;
    case 3:
      break;
  }
} ,
    );
  }


  
}
