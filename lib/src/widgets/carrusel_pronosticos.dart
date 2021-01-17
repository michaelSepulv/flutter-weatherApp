

import 'package:flutter/material.dart';
import 'package:weather_app/src/models/ciudad_model.dart';
import 'package:weather_app/src/models/pronosticos_model.dart';
import 'package:weather_app/src/providers/ciudades_provider.dart';




class CarruselPronosticoWidget extends StatelessWidget {
  
  final String lat ;
  final String lon;
  
  CarruselPronosticoWidget({@required this.lat, @required this.lon});

  @override
  Widget build(BuildContext context) {
    
    final ciudadesProvider = new CiudadesProvider();
    final _screenSize = MediaQuery.of(context).size;
    
    return Container(
      height: _screenSize.height *0.48,
      width:  double.infinity,
      child: FutureBuilder(
        future: ciudadesProvider.getListaPronostico(this.lat, this.lon),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot){
          if (snapshot.hasData){
            if (snapshot.data.isEmpty) {
              return Center(
                child: Text("No hay próximos pronósticos disponibles"),
              );
            }
            return PronosticosHorizontal(pronosticos: snapshot.data);
          }else{
            return Center(child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ));
          }
        }
      ),
    );
  }

}

class PronosticosHorizontal extends StatelessWidget {
  
  final List<Pronostico> pronosticos;
  PronosticosHorizontal({ @required this.pronosticos });

  @override
  Widget build(BuildContext context) {

    return PageView(
      children: _tarjetasCiudades(context),
      controller: PageController(
        initialPage: 0,
        viewportFraction: 0.8
      ),
    );
  }

  List<Widget> _tarjetasCiudades(BuildContext context){
    
    final _screenSize = MediaQuery.of(context).size;
    List<Widget> _tarjetas = new List();

    for (var i = 0; i < 3; i++) {
      String titulo = '';
      switch (i) {
        case 0: 
          titulo = "Mañana";
          break;
        case 1:
          titulo = "Pasado Mañana";
          break;
        case 2:
          titulo = "Tras Pasado Mañana";
          break;
        default: titulo = "Mañana";
      }
      final imageUrl = 'http://openweathermap.org/img/wn/${ pronosticos[i].weather[0].icon }@2x.png';
      final _tarjeta = Container(
        height: _screenSize.height * 0.47,
        width:  _screenSize.width * 0.35,
        margin: EdgeInsets.symmetric(horizontal: _screenSize.width * 0.02),
        padding: EdgeInsets.symmetric(vertical: _screenSize.height * 0.02),
        decoration: BoxDecoration(
          color: Color(0xfA670CA44),
          borderRadius: BorderRadius.circular(40)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(titulo, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
            Container(
              width: _screenSize.height * 0.2,
              height: _screenSize.height * 0.2,
              child: FadeInImage(
                placeholder: AssetImage('assets/loading.gif'), 
                image: NetworkImage(imageUrl)),
            ),
            Text(pronosticos[i].weather[0].description.toUpperCase() , style: TextStyle(color: Colors.white, fontSize: 20),),
            Text('Temp max: ${ pronosticos[i].temp.max } °C', style: TextStyle(color: Colors.white),),
            Text('Temp. min: ${ pronosticos[i].temp.min } °C', style: TextStyle(color: Colors.white,),),
            Text('Vel. Viento: ${ pronosticos[i].windSpeed } mts/s', style: TextStyle(color: Colors.white,),),
            Text('Humedad: ${ pronosticos[i].humidity } %', style: TextStyle(color: Colors.white,),),
          ],
        ),
      );
      _tarjetas.add(_tarjeta);
      
    }
    return _tarjetas;
  }
}