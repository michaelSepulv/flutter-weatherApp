
class Ciudades{
  List<Ciudad> items = new List();

  Ciudades();

  Ciudades.fromJsonList( List<dynamic> jsonList){
    if ( jsonList == null) return;
    
    for (var item in jsonList) {
      final ciudad = new Ciudad.fromJsonMap(item);
      items.add(ciudad);

    }
  }
}

class Ciudad {
  int id;
  int dt;
  String name;
  Coord coord;
  Main main;
  Wind wind;
  Sys sys;
  dynamic rain;
  dynamic snow;
  List<Weather> weather;

  Ciudad({
    this.id,
    this.dt,
    this.name,
    this.coord,
    this.main,
    this.wind,
    this.rain,
    this.sys,
    this.snow,
    this.weather,
  });

  Ciudad.fromJsonMap( Map<String, dynamic> json ){
      
      var list = json['weather'] as List;
      List<Weather> weatherList = list.map((i)=> Weather.fromJsonMap(i)).toList();
      id      = json['id'];
      dt      = json['dt'];
      name    = json['name'];
      coord   = Coord.fromJsonMap(json['coord']);
      main    = Main.fromJsonMap(json['main']);
      wind    = Wind.fromJsonMap(json['wind']);
      rain    = json['rain'];
      snow    = json['snow'];
      sys     = Sys.fromJsonMap(json['sys']);
      weather = weatherList;
  }

}


class Coord {
  double lon;
  double lat;

  Coord({
    this.lon,
    this.lat,
  });

  factory Coord.fromJsonMap( Map<String, dynamic> jsonMap ){
    return Coord(
      lon: jsonMap['lon'] / 1,
      lat: jsonMap['lat'] / 1 ,
    );
    
  }
}

class Sys{
  String country;

  Sys({this.country});

  factory Sys.fromJsonMap(Map<String, dynamic> json ){
    return Sys(
      country: json['country']
    );
  }
}

class Main {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  factory Main.fromJsonMap( Map<String, dynamic> json){
    return Main(
      temp      : json['temp'] / 1,
      feelsLike : json['feels_like'] / 1,
      tempMin   : json['temp_min'] / 1,
      tempMax   : json['temp_max'] / 1,
      pressure  : json['pressure'],
      humidity  : json['humidity'],
    );
  }
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJsonMap(Map<String, dynamic> json){
    return Weather(
      id          : json['id'],
      main        : json['main'],
      description : json['description'],
      icon        : json['icon'],

    );

  }
}


class Wind {
  double speed;
  int deg;

  Wind({
    this.speed,
    this.deg,
  });

  factory Wind.fromJsonMap(Map<String, dynamic> json){
    return Wind(
      speed : json['speed'] / 1,
      deg   : json['deg'],

    );
  } 
}
