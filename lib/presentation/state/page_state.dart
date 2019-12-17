import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class PageState extends Equatable {
  final List<dynamic> _props;
  PageState([this._props = const<dynamic>[]]):super(_props);
}

class NoneState extends PageState{ }
class LoadingState extends PageState{ }
class ErrorState extends PageState {
  final String message;
  ErrorState({@required this.message});
}