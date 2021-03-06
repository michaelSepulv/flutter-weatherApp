//componentes nativos
import 'dart:async';
import 'dart:convert';
//modelos

import 'package:weather_app/src/models/ciudad_model.dart';

//paquetes
import 'package:http/http.dart' as http;
import 'package:weather_app/src/models/pronosticos_model.dart';


class CiudadesProvider{

  String _apikey = '71c6990c09914a8b6b35662e2385fb16';

  //Peticion http para obtener las ciudades de homePage
  Future <List<Ciudad>> getListaCiudades() async{
    
    String lat = '-33.021262';
    String lon = '-71.560829';
    String cnt = '20';
    

    final urlCiudadesHome = 'http://api.openweathermap.org/data/2.5/find?lat=${ lat }&lang=es&lon=${ lon }&cnt=${ cnt }&units=metric&appid=${ _apikey }';

    final resp = await http.get(urlCiudadesHome);
    final decodedData = json.decode(resp.body);

    final ciudades = new Ciudades.fromJsonList(decodedData['list']);
    return ciudades.items;

  }

  //Peticion http para pronostico de una ciudad especifica
  Future <List<Pronostico>> getListaPronostico(String lat, String lon) async{

    final urlPronosticos = 'https://api.openweathermap.org/data/2.5/onecall?lat=${lat}&lon=${lon}&exclude=current,minutely,hourly,alerts&lang=es&units=metric&appid=${_apikey}';

    final resp = await http.get(urlPronosticos);
    final decodedData = json.decode(resp.body);
    final pronosticos = new Pronosticos.fromJsonList(decodedData['daily']);
    return pronosticos.items;
  }

  //Peticion http para buscar ciuddad
  
  Future<Ciudad> buscarCiudad(String query)async{
    query = query.replaceAll(' ', '+');
    print('consulta: ${query}');
    try {
      final urlSearch = 'http://api.openweathermap.org/data/2.5/weather?q=${query}&lang=es&units=metric&appid=${_apikey}';
      final resp = await http.get(urlSearch);
      //if (resp.statusCode == 404) return [];
        
      final decodedData = json.decode(resp.body);
      final ciudad = new Ciudad.fromJsonMap(decodedData);
      return ciudad;
      
    } catch (e) {
      print(e);
      return null;
    }
  }
}