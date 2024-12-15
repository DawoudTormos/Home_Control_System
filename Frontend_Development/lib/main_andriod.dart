import 'package:edittable_grid_flutter/widgets/navbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainAndriod extends StatelessWidget {
  const MainAndriod({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //textDirection:  TextDirection.ltr,
      home: Scaffold(
        backgroundColor:Colors.white,
      
        body: const SizedBox(),
        bottomNavigationBar: NavBar(), 
      ),
    );
  }
}