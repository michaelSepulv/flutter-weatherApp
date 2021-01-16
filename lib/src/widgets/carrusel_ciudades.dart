import 'package:flutter/material.dart';




class CarruselWidget extends StatelessWidget {
  
  //TODO: incorporar backend
  /* final List<Ciudad> ciudaades;

  CarruselWidget({ @required this.ciudades });
  final _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.4
  ); */
  
  @override
  Widget build(BuildContext context) {
    
    final _screenSize = MediaQuery.of(context).size;
    
    return Container(
      height: _screenSize.height *0.7,
      width:  double.infinity,
      color: Colors.red,
    );
  }

}