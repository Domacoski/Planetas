import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:lista_planetas/features/model/planet_model.dart';

final String url = "https://domacoski.github.io/planetas.json";

Future<http.Response> readPlanets(){
  return http.get(url);
}


Future<List<PlanetModel>> getPlanetList() async {
  final http.Response response = await readPlanets();
  if(response.statusCode == 200){
    final result = json.decode(response.body) as List;
    return result.map((i) => PlanetModel.fromJson(i)).toList();
  }else{
    throw Exception("Http status code: ${response.statusCode}");
  }
}

