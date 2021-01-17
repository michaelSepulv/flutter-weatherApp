class Pronosticos{
  List<Pronostico> items = new List();
  Pronosticos();

  Pronosticos.fromJsonList(List<dynamic> jsonList){
    if ( jsonList == null ) return;

    for (var item in jsonList) {
      final pronostico = new Pronostico.fromJsonMap(item);
      items.add(pronostico);
    }
  }
}

class Pronostico {
  int dt;
  int sunrise;
  int sunset;
  Temp temp;
  int humidity;
  double dewPoint;
  double windSpeed;
  int windDeg;
  List<Weather> weather;

  Pronostico({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.humidity,
    this.windSpeed,
    this.windDeg,
    this.weather,
  });

  Pronostico.fromJsonMap( Map<String, dynamic> json ){
    var list = json['weather'] as List;
    List<Weather> weatherList = list.map((i)=> Weather.fromJsonMap(i)).toList();

    dt         = json['dt'];
    sunrise    = json['sunrise'];
    sunset     = json['sunset'];
    temp       = Temp.fromJsonMap(json['temp']) ;
    humidity   = json['humidity'];
    windSpeed  = json['wind_speed'] / 1;
    windDeg    = json['wind_deg'];
    weather    = weatherList;
  }
}

class Temp {
  double day;
  double min;
  double max;
  double night;
  double eve;
  double morn;

  Temp({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });

  factory Temp.fromJsonMap(Map<String, dynamic> json){
    return Temp(
      day   : json['day'] / 1 ,
      min   : json['min'] / 1 ,
      max   : json['max'] / 1 ,
      night : json['night'] / 1  ,
      eve   : json['eve'] / 1,
      morn  : json['morn'] / 1  ,
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