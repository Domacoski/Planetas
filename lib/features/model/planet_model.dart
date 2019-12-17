import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PlanetModel extends Equatable {
  final String nome;
  final String url;
  final String descricao;
  bool favorito;

  PlanetModel({
    @required this.nome,
    @required this.url,
    @required this.descricao,
    this.favorito = false});

  factory PlanetModel.fromJson(Map<String, dynamic> map){
    return PlanetModel(
      nome: map['nome'],
      url: map['img'],
      descricao: map['descricao']
    );
  }
}