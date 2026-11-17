import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ingredient_demo/ingredient_card.dart';

// Cung cấp Material Theme và vùng hiển thị cho thẻ.
Widget wrapCard(IngredientCard card) {
  return MaterialApp(
    home: Scaffold(body: Center(child: card)),
  );
}

void main() {
  final checkbox = find.byType(Checkbox);

  testWidgets('IngredientCard hiển thị cùng ô đánh dấu', (tester) async {
    // Arrange – Chuẩn bị
    final card = wrapCard(IngredientCard(name: 'Sữa tươi', onChecked: (_) {}));

    // Act – Thao tác
    await tester.pumpWidget(card);

    // Assert – Xác nhận
    expect(find.byType(IngredientCard), findsOneWidget);
    expect(checkbox, findsOneWidget);
  });

  testWidgets('hiển thị tên nguyên liệu', (tester) async {
    // Arrange – Chuẩn bị
    final card = wrapCard(IngredientCard(name: 'Sữa tươi', onChecked: (_) {}));

    // Act – Thao tác
    await tester.pumpWidget(card);

    // Assert – Xác nhận
    expect(find.text('Sữa tươi'), findsOneWidget);
  });

  testWidgets('ô đánh dấu ban đầu chưa được chọn', (tester) async {
    // Arrange – Chuẩn bị
    final card = wrapCard(IngredientCard(name: 'Sữa tươi', onChecked: (_) {}));

    // Act – Thao tác
    await tester.pumpWidget(card);

    // Assert – Xác nhận
    expect(tester.widget<Checkbox>(checkbox).value, isFalse);
  });

  testWidgets('nhấn vào ô chưa chọn để đánh dấu', (tester) async {
    // Arrange – Chuẩn bị
    await tester.pumpWidget(
      wrapCard(IngredientCard(name: 'Sữa tươi', onChecked: (_) {})),
    );

    // Act – Thao tác
    await tester.tap(checkbox);
    await tester.pumpAndSettle();

    // Assert – Xác nhận
    expect(tester.widget<Checkbox>(checkbox).value, isTrue);
  });

  testWidgets('nhấn vào ô đã chọn để bỏ đánh dấu', (tester) async {
    // Arrange – Chuẩn bị
    final reported = <bool>[];
    await tester.pumpWidget(
      wrapCard(
        IngredientCard(
          name: 'Sữa tươi',
          initiallyChecked: true,
          onChecked: reported.add,
        ),
      ),
    );
    expect(tester.widget<Checkbox>(checkbox).value, isTrue);

    // Act – Thao tác
    await tester.tap(checkbox);
    await tester.pumpAndSettle();

    // Assert – Xác nhận
    expect(tester.widget<Checkbox>(checkbox).value, isFalse);
    expect(reported, [false]);
  });

  testWidgets('onChecked lần lượt báo true và false', (tester) async {
    // Arrange – Chuẩn bị
    final reported = <bool>[];
    await tester.pumpWidget(
      wrapCard(IngredientCard(name: 'Sữa tươi', onChecked: reported.add)),
    );

    // Act và Assert – Thao tác và xác nhận
    await tester.tap(checkbox);
    await tester.pumpAndSettle();
    expect(tester.widget<Checkbox>(checkbox).value, isTrue);
    await tester.tap(checkbox);
    await tester.pumpAndSettle();
    expect(tester.widget<Checkbox>(checkbox).value, isFalse);
    expect(reported, [true, false]);
  });

  testWidgets('tên chỉ bị gạch ngang khi đã chọn', (tester) async {
    // Arrange – Chuẩn bị
    await tester.pumpWidget(
      wrapCard(IngredientCard(name: 'Sữa tươi', onChecked: (_) {})),
    );
    final name = find.text('Sữa tươi');
    expect(tester.widget<Text>(name).style?.decoration, TextDecoration.none);

    // Act và Assert – Thao tác và xác nhận
    await tester.tap(checkbox);
    await tester.pumpAndSettle();
    expect(
      tester.widget<Text>(name).style?.decoration,
      TextDecoration.lineThrough,
    );
    await tester.tap(checkbox);
    await tester.pumpAndSettle();
    expect(tester.widget<Text>(name).style?.decoration, TextDecoration.none);
  });
}
