import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ingredient_demo/ingredient_card.dart';

void main() {
  setUpAll(() async {
    // Nạp font đi kèm để ảnh chuẩn hiển thị được chữ có dấu.
    final font = FontLoader('DemoRoboto')
      ..addFont(rootBundle.load('assets/fonts/Roboto-Regular.ttf'));
    await font.load();
  });

  for (final brightness in Brightness.values) {
    for (final checked in [false, true]) {
      final state = checked ? 'checked' : 'unchecked';
      final file = 'goldens/ingredient_${brightness.name}_$state.png';

      testWidgets(
        '${brightness == Brightness.light ? 'Sáng' : 'Tối'}: ${checked ? 'đã chọn' : 'chưa chọn'}',
        (tester) async {
          // Arrange – Chuẩn bị
          tester.view.devicePixelRatio = 1;
          tester.view.physicalSize = const Size(400, 200);
          addTearDown(tester.view.resetDevicePixelRatio);
          addTearDown(tester.view.resetPhysicalSize);
          const captureKey = ValueKey('ingredient-capture');

          // Act – Dựng giao diện
          await tester.pumpWidget(
            MaterialApp(
              locale: const Locale('en', 'US'),
              theme: ThemeData(
                brightness: brightness,
                colorSchemeSeed: Colors.blue,
                fontFamily: 'DemoRoboto',
              ),
              home: Scaffold(
                body: Center(
                  child: RepaintBoundary(
                    key: captureKey,
                    child: SizedBox(
                      width: 320,
                      child: IngredientCard(
                        name: 'Sữa tươi',
                        evenRow: true,
                        initiallyChecked: checked,
                        onChecked: (_) {},
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
          await tester.pumpAndSettle();

          // Assert – So sánh ảnh
          await expectLater(find.byKey(captureKey), matchesGoldenFile(file));
        },
      );
    }
  }
}
