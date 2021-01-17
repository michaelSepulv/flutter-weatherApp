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

      body: _cuerpo( _screenSize, context ),
    );
  }


  Widget _cuerpo( size, BuildContext context ){
    
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
            padding: EdgeInsets.all(size.height * 0.018),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Text('Ciudades cercanas', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),),
          ),

          SizedBox(height: size.height * 0.03),

          CarruselWidget()
        ],
      ),
    );
  }
}


