import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:lista_planetas/features/model/planet_model.dart';
import 'package:lista_planetas/main.dart';
import 'package:lista_planetas/presentation/widget/planet_item_widget.dart';

void main() {


  testWidgets('test message card', (WidgetTester tester) async{
    await tester.pumpWidget(MyApp());
    expect(find.text('Sistema Solar'), findsOneWidget);
  });

  final PlanetModel model = PlanetModel(
      descricao: "description",
      url:"https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Mercury_in_color_-_Prockter07-edit1.jpg/600px-Mercury_in_color_-_Prockter07-edit1.jpg",
      nome: "Mercury"
  );
  testWidgets('test list item', (WidgetTester tester) async{
    provideMockedNetworkImages(() async{
      await tester.pumpWidget(
        StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return MaterialApp(
              home: Material(
                child: Center(
                  child: PlanetItemWidget(planet: model,),
                ),
              ),
            );
          },
        ),
      );

      expect(find.text('Mercury'), findsOneWidget);

    });
  });

}
