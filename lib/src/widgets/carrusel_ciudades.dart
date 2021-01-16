import 'package:flutter/material.dart';
import 'package:weather_app/src/models/ciudad_model.dart';
import 'package:weather_app/src/providers/ciudades_provider.dart';




class CarruselWidget extends StatelessWidget {
  

  
  @override
  Widget build(BuildContext context) {
    
    final ciudadesProvider = new CiudadesProvider();
    final _screenSize = MediaQuery.of(context).size;
    
    return Container(
      height: _screenSize.height *0.7,
      width:  double.infinity,
      child: FutureBuilder(
        future: ciudadesProvider.getListaCiudades(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot){
          if (snapshot.hasData){
            return CiudadesHorizontal(ciudades: snapshot.data);
          }else{
            return Center(child: CircularProgressIndicator());
          }
        }
      ),
    );
  }

}

class CiudadesHorizontal extends StatelessWidget {
  
  final List<Ciudad> ciudades;
  CiudadesHorizontal({ @required this.ciudades });

  @override
  Widget build(BuildContext context) {

    return PageView(
      
      children: _tarjetasCiudades(context),
      controller: PageController(
        initialPage: 1,
        viewportFraction: 0.8
      ),
    );
  }

  List<Widget> _tarjetasCiudades(BuildContext context){
    
    final _screenSize = MediaQuery.of(context).size;
    return ciudades.map( (ciudad){
      return Container(
        height: _screenSize.height * 0.65,
        width:  _screenSize.width * 0.4,
        margin: EdgeInsets.symmetric(horizontal: _screenSize.width * 0.02),
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(40)
        ),
        child: Column(
          
          children: <Widget>[
            SizedBox(height: _screenSize.height * 0.03,),
            Text('Ciudad: ${ ciudad.name }', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 25),),
            Text('Temp. actual: ${ (ciudad.main.temp.toDouble() - 273.15).toStringAsFixed(2) } °C', style: TextStyle(color: Theme.of(context).primaryColor,),),
            Text('Temp. min: ${ (ciudad.main.tempMin.toDouble() - 273.15).toStringAsFixed(2) } °C', style: TextStyle(color: Theme.of(context).primaryColor,),),
            Text('Temp. min: ${ (ciudad.main.tempMax.toDouble() - 273.15).toStringAsFixed(2) } °C', style: TextStyle(color: Theme.of(context).primaryColor,),),
            Text('Humedad: ${ ciudad.main.humidity } %', style: TextStyle(color: Theme.of(context).primaryColor,),),

          ],
        ),
      );
    }).toList();
  }
}