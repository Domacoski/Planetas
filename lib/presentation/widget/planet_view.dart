import 'package:flutter/material.dart';
import 'package:lista_planetas/features/model/planet_model.dart';

class PlanetView extends StatelessWidget {
  final PlanetModel planet;

  PlanetView({@required this.planet}) : assert(planet != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: getNestedScrollView(context),
    );
  }

  Widget getNestedScrollView(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black,
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                  planet.nome,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  )
              ),
              background: Hero(
                tag: "img_${planet.nome}",
                child: Image.network(planet.url, fit: BoxFit.cover,),
              ),
            ),
          ),
        ];
      },
      body:  Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            planet.descricao,
            textAlign: TextAlign.left,
            style: Theme
                .of(context)
                .textTheme
                .body2
                .apply(color: Colors.white),
          ),
        ),
    );
  }




}
