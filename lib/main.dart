//componentes nativos
import 'package:flutter/material.dart';

//rutas
import 'package:weather_app/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wheather App',
      routes: getAppRoutes(),
      initialRoute: 'home',
    );
  }
}