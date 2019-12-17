import 'package:dartz/dartz.dart';

import 'package:lista_planetas/core/error/failure.dart';
import 'package:lista_planetas/features/model/planet_model.dart';

abstract class PlanetRepository{
  Future<Either<Failure, List<PlanetModel>>> getPlanets();
}