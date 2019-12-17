import 'package:flutter/material.dart';
import 'package:lista_planetas/presentation/controller/planets_list_controller.dart';
import 'package:lista_planetas/presentation/state/page_state.dart';
import 'package:lista_planetas/presentation/widget/utils_widget.dart';
import 'package:provider/provider.dart';
import 'package:lista_planetas/features/model/planet_model.dart';
import 'package:lista_planetas/presentation/widget/planet_item_widget.dart';

class PlanetsListWidget extends StatelessWidget{

  Widget _getPlanetsListView( List<PlanetModel> planets ){
    return ListView.builder(
        itemCount: planets.length,
        itemBuilder: (context, index) =>  PlanetItemWidget(planet: planets[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlanetsListController>(builder: (context, controller, widget){
      final state = controller.state;
      if(state is LoadedState){
        return _getPlanetsListView(state.planets);
      }else if(state is ErrorState){
        return getErrorWidget(context, "ERRO: ${state.message}");
      }else{
        return getLoader(context, "carregando....");
      }
    });
  }

}
