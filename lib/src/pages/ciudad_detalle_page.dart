import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/src/models/ciudad_model.dart';
import 'package:weather_app/src/search/search_delegate.dart';
import 'package:weather_app/src/widgets/carrusel_pronosticos.dart';


class CiudadDetallePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Ciudad ciudad = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(ciudad.name , style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(FontAwesomeIcons.search), 
          onPressed: ()=> showSearch(context: context, delegate: DataSearch()))
        ],

      ),
      body: _cuerpo(context, ciudad)
    );
  }

  Widget _cuerpo(BuildContext context, Ciudad ciudad){
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.all(_screenSize.height * 0.02 ),
                padding: EdgeInsets.all(_screenSize.height * 0.014 ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Text('Ciudad de: ${ciudad.name}', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
              ),
            ),
            _superior(context, ciudad, _screenSize),
            CarruselPronosticoWidget(lat: ciudad.coord.lat.toString(), lon: ciudad.coord.lon.toString())
          ],
        ),
      ),
    );
  }

  Widget _superior(BuildContext context, Ciudad ciudad, Size size){
    final imageUrl = 'http://openweathermap.org/img/wn/${ ciudad.weather[0].icon }@2x.png';
    return Padding(
      padding: EdgeInsets.all(size.height * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          
          Hero(
            tag: ciudad.id,
            child: Container(
              height: size.height * 0.15,
              width: size.height * 0.15,
              child: FadeInImage(
                placeholder: AssetImage("assets/loading.gif"),
                image: NetworkImage(imageUrl)),
            ),
          ),

          Column(
            children: <Widget>[
              Text('${ciudad.main.temp} °C', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 27),),
              Text('Clima: ${ ciudad.weather[0].description }'),
              Text('Temp min: ${ ciudad.main.tempMin } °C'),
              Text('Temp máx: ${ ciudad.main.tempMax } °C'),
              Text('Vel. del viento: ${ ciudad.wind.speed } mts/s'),
              Text('Humedad: ${ ciudad.main.humidity } %'),
              SizedBox(height: size.height *0.001),
              Row(
                children: <Widget>[
                  Text('Pais:'),
                  Flag(ciudad.sys.country, height: size.height * 0.03,width: size.height * 0.04)
                ],
              )
              

            ],
          ),
        ],
      ),
    );
  }
}