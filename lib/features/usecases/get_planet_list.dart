import 'package:dartz/dartz.dart';
import 'package:lista_planetas/core/error/failure.dart';
import 'package:lista_planetas/core/usecases/usecase.dart';
import 'package:lista_planetas/features/model/planet_model.dart';
import 'package:lista_planetas/features/repository/planet_repository.dart';


class GetPlanetList implements UseCase<List<PlanetModel>, NoParams>{

  final PlanetRepository repository;
  GetPlanetList({this.repository});

  @override
  Future<Either<Failure, List<PlanetModel>>> call(NoParams params) async {
    return await repository.getPlanets();
  }
}