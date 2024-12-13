import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '/pages/home.dart';
import '/pages/page_not_found.dart';
import 'router/app_router.dart' ;



void main() {
  configureWebURL();// to deal with web diffrenetly from other platforms regarding URLS
  runApp(MyApp());
}





class MyApp extends StatelessWidget {
  final AppRouter _router = AppRouter();
  final AppRouteInformationParser _routeInformationParser =
      AppRouteInformationParser();

   MyApp({super.key});// used to keep the index of keys and to be retrived from the db
  


  @override
  Widget build(BuildContext context) {
    

     

 return MaterialApp.router(
      routerDelegate: _router,
      routeInformationParser: _routeInformationParser,
    );
    


  }
}