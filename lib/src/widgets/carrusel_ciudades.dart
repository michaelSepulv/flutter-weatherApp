

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            if (snapshot.data.isEmpty) {
              return Center(
                child: Text("No hay ciudades disponibles"),
              );
            }
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
      final imageUrl = 'http://openweathermap.org/img/wn/${ ciudad.weather[0].icon }@2x.png';
      return Container(
        height: _screenSize.height * 0.65,
        width:  _screenSize.width * 0.4,
        margin: EdgeInsets.symmetric(horizontal: _screenSize.width * 0.02),
        padding: EdgeInsets.symmetric(vertical: _screenSize.height * 0.04),
        decoration: BoxDecoration(
          color: Color(0xfA670CA44),
          borderRadius: BorderRadius.circular(40)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            //SizedBox(height: _screenSize.height * 0.04,),
            Text('Ciudad: ${ ciudad.name }', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
            SizedBox(height: _screenSize.height * 0.05,),
            
            Container(
              width: _screenSize.height * 0.2,
              height: _screenSize.height * 0.2,
              child: FadeInImage(
                placeholder: AssetImage('assets/loading.gif'), 
                image: NetworkImage(imageUrl)),
            ),
            Text(ciudad.weather[0].description.toUpperCase() , style: TextStyle(color: Colors.white, fontSize: 20),),
            Text('${ (ciudad.main.temp.toDouble() - 273.15).toStringAsFixed(2) } °C', style: TextStyle(color: Colors.white, fontSize: 30),),
            Text('Temp. máx: ${ (ciudad.main.tempMin.toDouble() - 273.15).toStringAsFixed(2) } °C', style: TextStyle(color: Colors.white,),),
            Text('Temp. min: ${ (ciudad.main.tempMax.toDouble() - 273.15).toStringAsFixed(2) } °C', style: TextStyle(color: Colors.white,),),
            Text('Humedad: ${ ciudad.main.humidity } %', style: TextStyle(color: Colors.white,),),

            RaisedButton(
              color: Colors.blue,
              shape: StadiumBorder(),
              child: Text('Ver detalle', style: TextStyle(color: Colors.white),),
              onPressed: (){},
            )

          ],
        ),
      );
    }).toList();
  }
}