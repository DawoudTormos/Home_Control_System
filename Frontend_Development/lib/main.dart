import 'package:edittable_grid_flutter/main_mobile.dart';
import 'package:edittable_grid_flutter/main_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'web_router/app_router.dart';

String currentPage = "Dashboard";
void main() {
  configureWebURL(); // to deal with web diffrenetly from other platforms regarding URLS
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp(
      {super.key}); // used to keep the index of keys and to be retrived from the db

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      print("I am on web");
      return MainWeb();
    } else {
      return const MainMobile();
    }
  }
}
