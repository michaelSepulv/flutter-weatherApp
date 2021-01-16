import 'package:flutter/material.dart';


class CiudadDetallePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle Page', style: TextStyle(color: Colors.white),),
        centerTitle: true,

      ),
      body: Center(child: Text('Detalle Ciudad Page'),)
    );
  }
}