import 'package:flutter/material.dart';

import 'ingredient_card.dart';

void main() {
  runApp(const IngredientApp());
}

class IngredientApp extends StatelessWidget {
  const IngredientApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Danh sách nguyên liệu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue, fontFamily: 'DemoRoboto'),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.dark,
        fontFamily: 'DemoRoboto',
      ),
      home: const IngredientPage(),
    );
  }
}

class IngredientPage extends StatefulWidget {
  const IngredientPage({super.key});

  @override
  State<IngredientPage> createState() => _IngredientPageState();
}

class _IngredientPageState extends State<IngredientPage> {
  static const ingredients = ['Sữa tươi', 'Trứng gà', 'Phô mai'];
  String lastChange = 'Nhấn ô đánh dấu để cập nhật danh sách.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Danh sách nguyên liệu')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              for (final (index, name) in ingredients.indexed)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: IngredientCard(
                    key: ValueKey(name),
                    name: name,
                    evenRow: index.isEven,
                    // Hiện thông báo khi Widget cha nhận giá trị mới.
                    onChecked: (checked) {
                      setState(() {
                        lastChange = checked
                            ? '$name đã được chọn'
                            : '$name đã bỏ chọn';
                      });
                    },
                  ),
                ),
              const SizedBox(height: 12),
              Semantics(liveRegion: true, child: Text(lastChange)),
            ],
          ),
        ),
      ),
    );
  }
}
