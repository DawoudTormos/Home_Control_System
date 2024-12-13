import 'package:flutter/material.dart';
import "../widgets/Grid_of_Gridviews/main_grid.dart";

class Home extends StatelessWidget {
  List<String>? gridItemsIndexes;
  Map<String, List<Map<String, dynamic>>>? gridItems;

    Home({super.key , required this.gridItems  , required this.gridItemsIndexes });
   
  

  @override
  Widget build(BuildContext context) {
    
    final double screenWidth = MediaQuery.of(context).size.width;
    return  
          Scaffold(
            appBar: AppBar(title: const Text('Your devices')),
            body: SingleChildScrollView(
              //physics: BouncingScrollPhysics(),
              child: SizedBox(
                width: screenWidth,
                child: 
                    MainGrid(gridItems: gridItems , gridItemsIndexes : gridItemsIndexes),
                  
                ),
              ),
          );
  }
}