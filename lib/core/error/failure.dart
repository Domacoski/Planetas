import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final String message;
  Failure(String message): this.message = message;
}

class NetworkError extends Failure{
  NetworkError(String message) : super(message);
}

