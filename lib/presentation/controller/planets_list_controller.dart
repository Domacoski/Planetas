import 'package:flutter/foundation.dart';

import 'package:lista_planetas/core/usecases/usecase.dart';
import 'package:lista_planetas/features/model/planet_model.dart';
import 'package:lista_planetas/features/usecases/get_planet_list.dart';
import 'package:lista_planetas/presentation/state/page_state.dart';
import 'package:lista_planetas/presentation/controller/controller_model.dart';

class PlanetsListController extends ControllerModel {

  String error;
  final GetPlanetList getPlanetList;

  PlanetsListController({this.getPlanetList}){
    init();
  }
  
  
  void init() async{
    print('init list');
    state = LoadingState();
     var result = await getPlanetList(NoParams());
     result.fold(
         (failure){
           print("Fail => [ $failure ]");
           state = ErrorState(message: failure.message);
           notifyListeners();
         },
         (list){
           print("Loaded List!!!");
           state = LoadedState(planets: list);
           notifyListeners();
         });
  }
}

class LoadedState extends PageState{
  final List<PlanetModel> planets;
  LoadedState({@required this.planets});
}