

import 'package:flutter/cupertino.dart';
import 'package:weather_app/src/pages/home_page.dart';

Map<String, WidgetBuilder> getAppRoutes(){
  return <String, WidgetBuilder>{
    'home'    :   (BuildContext context) => HomePage(),
  };
}