import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lista_planetas/presentation/controller/planets_list_controller.dart';
import 'package:lista_planetas/features/usecases/get_planet_list.dart';
import 'package:lista_planetas/features/repository/network/planets_repository_network_impl.dart';
import 'package:lista_planetas/features/repository/network/planets_network.dart';
import 'package:lista_planetas/presentation/widget/planets_list_widget.dart';

class PlanetsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PlanetsListController>.value(
            value: PlanetsListController(
                getPlanetList: GetPlanetList(
                    repository: PlanetsRepositoryNetworkImpl(
                        network: PlanetsNetwork())))),
      ],
      child: Scaffold(
        backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("Sistema Solar"),
      ),
        body: PlanetsListWidget(),
      ),
    );
  }
}
