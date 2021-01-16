//componentes nativos
import 'dart:convert';
//modelos

import 'package:weather_app/src/models/ciudad_model.dart';

//paquetes
import 'package:http/http.dart' as http;


class CiudadesProvider{

  String _apikey = '71c6990c09914a8b6b35662e2385fb16';
  String _url    = 'api.openweathermap.org/data/2.5';

  
  Future <List<Ciudad>> getListaCiudades() async{
    
    String lat = '-33.865261';
    String lon = '-71.824560';
    String cnt = '20';
    

    final url2 = 'http://api.openweathermap.org/data/2.5/find?lat=${ lat }&lon=${ lon }&cnt=${ cnt }&appid=${ _apikey }';

    final resp = await http.get(url2);
    final decodedData = json.decode(resp.body);

    final ciudades = new Ciudades.fromJsonList(decodedData['list']);
    return [];

  }
}