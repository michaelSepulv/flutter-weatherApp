import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/src/models/ciudad_model.dart';
import 'package:weather_app/src/providers/ciudades_provider.dart';


class DataSearch extends SearchDelegate {
  
  final ciudadesProvider = CiudadesProvider();
  @override
  List<Widget> buildActions(BuildContext context) {
    //acciones del appbar
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: ()=>query = ''),

    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // icono de la izquierda del appbar
    return IconButton(
    icon: AnimatedIcon(
      icon: AnimatedIcons.menu_arrow,
      progress: transitionAnimation,
      ),
    onPressed: ()=>close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los listile con resultados
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Crea las sugerencias mientras se escribe
    if (query.isEmpty){
      return Center(
        child: Text('Ingrese una ciudad'),
      );
    }

    return FutureBuilder(
      future: ciudadesProvider.buscarCiudad(query),
      builder: (context, AsyncSnapshot<Ciudad> snapshot){
        if (snapshot.hasData) {
          final ciudad = snapshot.data;
          final imageUrl = 'http://openweathermap.org/img/wn/${ ciudad.weather[0].icon }@2x.png';
          return ListView(
            children: <Widget>[
              ListTile(
                leading: FadeInImage(
                  placeholder: AssetImage('assets/loading.gif'), 
                  image: NetworkImage(imageUrl),
                  width: 50,
                  fit: BoxFit.cover
                  ),
                title: Text(ciudad.name),
                subtitle: Text('${ ciudad.main.temp } °C - ${ ciudad.weather[0].description }'),
                onTap:(){
                  close(context, null);
                  Navigator.pushNamed(context, 'detalle',arguments: ciudad);
                },
              )
            ],
            
            
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
          );
        }
      }
    );
  }




}