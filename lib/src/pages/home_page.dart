import 'package:flutter/material.dart';
import 'package:weather_app/src/providers/ciudades_provider.dart';
import 'package:weather_app/src/widgets/carrusel_ciudades.dart';




class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App', style: TextStyle(color: Colors.white),),
        centerTitle: true,

      ),

      body: _cuerpo( _screenSize ),
    );
  }


  Widget _cuerpo( size ){
    
    final ciudadesProvider = new CiudadesProvider();
    ciudadesProvider.getListaCiudades();

    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.05),

          Container(
            child: Text('Ciudades cercanas'),
          ),

          SizedBox(height: size.height * 0.05),

          CarruselWidget()
        ],
      ),
    );
  }
}


