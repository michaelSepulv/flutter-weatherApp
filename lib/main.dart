//componentes nativos
import 'package:flutter/material.dart';

//paginas
import 'package:weather_app/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wheather App',
      routes: {
        'home'  :   (BuildContext context) => HomePage(),
      },
      initialRoute: 'home',
    );
  }
}