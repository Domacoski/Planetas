import 'package:flutter/foundation.dart';

import 'package:lista_planetas/presentation/state/page_state.dart';

abstract class ControllerModel extends ChangeNotifier{
  PageState state = NoneState();
}