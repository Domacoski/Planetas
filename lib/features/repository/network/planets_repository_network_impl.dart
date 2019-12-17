import 'package:dartz/dartz.dart';

import 'package:lista_planetas/core/error/failure.dart';
import 'package:lista_planetas/features/model/planet_model.dart';
import 'package:lista_planetas/features/repository/planet_repository.dart';
import 'package:lista_planetas/features/repository/network/planets_network.dart';

class PlanetsRepositoryNetworkImpl implements PlanetRepository{

  final PlanetsNetwork network;

  PlanetsRepositoryNetworkImpl({this.network});

  @override
  Future<Either<Failure, List<PlanetModel>>> getPlanets() async {
    print('PlanetsRepositoryNetworkImpl get list...');
    try{
      final List<PlanetModel> list = await network.getPlanetList();
      return Right(list);
    }catch(e){
      return Left(e);
    }
  }

}