import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;


import 'package:lista_planetas/features/model/planet_model.dart';
import 'package:lista_planetas/core/error/failure.dart';



class PlanetsNetwork {
  final String url = "https://domacoski.github.io/planetas.json";

  Future<http.Response> readNetWorkPlanets(){
    print('readNetWorkPlanets....');
    return http.get(url);
  }

  Future<List<PlanetModel>> getPlanetList() async {
    print('getPlanetList....');
    final http.Response response = await readNetWorkPlanets();
    print('getPlanetList status code: [ ${response.statusCode} ]');
    if(response.statusCode == 200){
      final result = json.decode(response.body) as List;
      print('return result...');
      return result.map((i) => PlanetModel.fromJson(i)).toList();
    }else{
      throw NetworkError("Http status code: ${response.statusCode}");
    }
  }
}