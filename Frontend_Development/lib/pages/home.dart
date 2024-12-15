import 'package:flutter/material.dart';
import "../widgets/Grid_of_Gridviews/main_grid.dart";
import "../widgets/navbar.dart";

class Home extends StatelessWidget {
  final List<String>? gridItemsIndexes;
  final Map<String, List<Map<String, dynamic>>>? gridItems;

  const Home({
    super.key,
    required this.gridItems,
    required this.gridItemsIndexes,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(color:Colors.white),
      child: SingleChildScrollView(
        //physics: BouncingScrollPhysics(),
        child: SizedBox(
          width: screenWidth,
          child: MainGrid(
              gridItems: gridItems, gridItemsIndexes: gridItemsIndexes),
        ),
      ),


      
    );
  }
}
