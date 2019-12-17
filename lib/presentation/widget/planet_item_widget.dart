import 'package:flutter/material.dart';
import 'package:lista_planetas/features/model/planet_model.dart';
import 'package:meta/meta.dart';
import 'package:lista_planetas/presentation/widget/planet_view.dart';

final _rowHeight = 100.0;

class PlanetItemWidget extends StatelessWidget {
  final PlanetModel planet;

  const PlanetItemWidget(
      {@required this.planet})
      :assert(planet != null);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        color: Colors.black,
        height: _rowHeight,
        child: InkWell(
          onTap: (){
            print("Open ${planet.nome}...");
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return PlanetView(planet: planet);
            }));
          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Hero(
                      tag: "img_${planet.nome}",
                      child: Image.network(planet.url),
                ),
                ),
                Center(
                  child: Text(
                    planet.nome,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline.apply(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
