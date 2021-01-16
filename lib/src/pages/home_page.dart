import 'package:flutter/material.dart';




class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App', style: TextStyle(color: Colors.white),),
        centerTitle: true,

      ),

      body: Container(
        width: _screenSize.width,
        height: _screenSize.height,
      ),
    );
  }
}


