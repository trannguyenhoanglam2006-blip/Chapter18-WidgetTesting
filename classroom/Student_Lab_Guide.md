# Hướng dẫn thực hành Widget Testing

Bạn sẽ tạo dự án nhỏ, kiểm thử thao tác nhấn Checkbox rồi so sánh ảnh giao diện. Chuẩn bị Flutter và VS Code. Trong PowerShell, kiểm tra môi trường.

```powershell
flutter --version
flutter doctor
flutter devices
```

Chrome nên xuất hiện trong danh sách. Dự án kèm theo dùng Flutter 3.47.5 và Dart 3.13.4 trên Windows. Trong bài thực hành này, bạn tự tạo ảnh chuẩn trên máy của mình.

### 1. Tạo dự án

Mở Terminal tại thư mục `Chapter18-WidgetTesting`, nơi có file README. Ghi lại đường dẫn bộ tài liệu và tạo một dự án riêng trong thư mục người dùng.

```powershell
$kit = (Get-Location).Path
Set-Location $env:USERPROFILE
flutter create --empty --platforms web --project-name ingredient_demo widget_testing_lab
Set-Location widget_testing_lab
```

Nếu đã có thư mục `widget_testing_lab`, chọn tên khác cho thư mục trong cả hai lệnh. Giữ nguyên `--project-name ingredient_demo` để các dòng import bên dưới trỏ đúng gói.

### 2. Mở VS Code

```powershell
code .
```

Nếu lệnh `code` chưa có, dùng **File > Open Folder** trong VS Code và chọn thư mục vừa tạo. Tiếp tục ở Terminal cũ. Nếu mở Terminal mới, gán lại biến `$kit` bằng đường dẫn đầy đủ của bộ tài liệu.

### 3. Thêm IngredientCard

```powershell
Copy-Item "$kit/flutter_demo/lib/ingredient_card.dart" lib/
Copy-Item "$kit/flutter_demo/lib/main.dart" lib/
Copy-Item "$kit/flutter_demo/pubspec.yaml" .
Copy-Item "$kit/flutter_demo/assets" . -Recurse
flutter pub get
```

Mở `lib/ingredient_card.dart`. Tìm `initState()` để xem cách lấy trạng thái ban đầu, `setState()` để xem cách lưu giá trị mới và `onChecked` để xem giá trị được gửi đi. Trong `build()`, `TextDecoration.lineThrough` gạch ngang tên nguyên liệu khi `isChecked` bằng `true`.

### 4. Chạy ứng dụng

```powershell
flutter run -d chrome
```

Nhấn vào ô của Sữa tươi. Ô có dấu chọn, tên bị gạch ngang và dòng dưới danh sách hiện «Sữa tươi đã được chọn». Nhấn lần nữa để xem «Sữa tươi đã bỏ chọn». Nhấn `q` trong Terminal khi đã xong.

### 5. Tạo file Widget Test

```powershell
New-Item -ItemType Directory -Force test
New-Item -ItemType File test/ingredient_card_test.dart
```

Mở file mới trong VS Code. `pubspec.yaml` đã có `flutter_test`.

### 6. Viết hai bài kiểm thử đầu tiên

Dán đoạn mã này vào `test/ingredient_card_test.dart`. Bài đầu kiểm tra chữ. Bài thứ hai nhấn vào Checkbox và đọc giá trị mới.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ingredient_demo/ingredient_card.dart';

Widget wrapCard(IngredientCard card) {
  return MaterialApp(home: Scaffold(body: Center(child: card)));
}

void main() {
  testWidgets('hiển thị tên nguyên liệu', (tester) async {
    // Arrange – Chuẩn bị
    final card = wrapCard(IngredientCard(name: 'Sữa tươi', onChecked: (_) {}));

    // Act – Dựng giao diện
    await tester.pumpWidget(card);

    // Assert – Xác nhận
    expect(find.text('Sữa tươi'), findsOneWidget);
  });

  testWidgets('nhấn vào ô chưa chọn để đánh dấu', (tester) async {
    // Arrange – Chuẩn bị
    await tester.pumpWidget(
      wrapCard(IngredientCard(name: 'Sữa tươi', onChecked: (_) {})),
    );
    final checkbox = find.byType(Checkbox);

    // Act – Thao tác
    await tester.tap(checkbox);
    await tester.pumpAndSettle();

    // Assert – Xác nhận
    expect(tester.widget<Checkbox>(checkbox).value, isTrue);
  });
}
```

`wrapCard` cung cấp Material Theme và một vùng hiển thị. `find.text()` tìm theo nội dung chữ. `find.byType()` tìm theo loại Widget. Sau khi nhấn, `pumpAndSettle()` chờ giao diện ổn định rồi `expect()` kiểm tra kết quả.

### 7. Chạy Widget Test

```powershell
flutter test test/ingredient_card_test.dart
```

Tìm dòng `+2: All tests passed!`. Hai bài kiểm thử của bài thực hành đã đạt.

### 8. Cố tình tạo lỗi thao tác

Trong `lib/ingredient_card.dart`, vào `updateChecked()`. Đổi `isChecked = newValue;` thành `isChecked = false;` và lưu.

### 9. Quan sát lỗi

```powershell
flutter test test/ingredient_card_test.dart
```

Bài kiểm tra tên vẫn đạt. Bài kiểm tra thao tác nhấn báo `Expected: true` và `Actual: <false>`. Dòng vừa sửa ép giá trị về `false` sau thao tác.

### 10. Khôi phục thao tác đúng

Đổi lại thành `isChecked = newValue;`, lưu rồi chạy lại.

```powershell
flutter test test/ingredient_card_test.dart
```

Cả hai bài đạt trở lại.

### 11. Tạo một Golden Test

```powershell
New-Item -ItemType File test/ingredient_golden_test.dart
```

Dán đoạn mã dưới đây vào file mới và lưu. Bài test dựng một thẻ Sữa tươi chưa chọn trong giao diện sáng. Kích thước và font được cố định. `RepaintBoundary` giới hạn vùng chụp vào thẻ.

```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ingredient_demo/ingredient_card.dart';

void main() {
  setUpAll(() async {
    final font = FontLoader('DemoRoboto')
      ..addFont(rootBundle.load('assets/fonts/Roboto-Regular.ttf'));
    await font.load();
  });

  testWidgets('giao diện sáng, chưa chọn', (tester) async {
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
          colorSchemeSeed: Colors.blue,
          fontFamily: 'DemoRoboto',
        ),
        home: Scaffold(
          body: Center(
            child: RepaintBoundary(
              key: captureKey,
              child: SizedBox(
                width: 320,
                child: IngredientCard(name: 'Sữa tươi', onChecked: (_) {}),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Assert – So sánh ảnh
    await expectLater(
      find.byKey(captureKey),
      matchesGoldenFile('goldens/ingredient_light_unchecked.png'),
    );
  });
}
```

### 12. Tạo ảnh chuẩn và kiểm tra lại

```powershell
flutter test --update-goldens test/ingredient_golden_test.dart
```

Mở `test/goldens/ingredient_light_unchecked.png`. Bạn sẽ thấy thẻ Sữa tươi nền xanh nhạt, ô chưa có dấu chọn. Đây là ảnh đối chiếu.

```powershell
flutter test test/ingredient_golden_test.dart
```

Tìm `+1: All tests passed!`. Lần này Flutter so sánh ảnh vừa dựng với ảnh đã lưu.

### 13. Cố tình thay đổi màu nền

Trong `Material` của `lib/ingredient_card.dart`, đổi `color: rowColor,` thành `color: Colors.red,` và lưu.

### 14. Quan sát Golden Test thất bại

```powershell
flutter test test/ingredient_golden_test.dart
```

Bài test báo `Pixel test failed`. Mở thư mục `test/failures` và xem `masterImage` (ảnh chuẩn), `testImage` (ảnh vừa dựng) và `isolatedDiff` (vùng khác biệt). Giữ nguyên ảnh chuẩn để đối chiếu sau khi sửa lỗi.

### 15. Khôi phục thiết kế đúng

Đổi lại thành `color: rowColor,`, lưu rồi chạy:

```powershell
flutter test test/ingredient_golden_test.dart
flutter test
flutter analyze
```

Golden Test đạt trở lại. Cả ba bài trong dự án thực hành phải đạt và `flutter analyze` phải báo không có vấn đề.

## Thử hai bài cuối chương

1. Đặt `initiallyChecked: true`, nhấn một lần và kiểm tra `Checkbox.value` bằng `false`. Tạo danh sách `reported`, truyền `onChecked: reported.add` và kiểm tra danh sách có đúng `[false]`.
2. Tạo hai Golden Test cho giao diện tối. Đặt `brightness: Brightness.dark` trong `ThemeData`. Dựng một thẻ đã chọn và một thẻ chưa chọn, đặt tên ảnh PNG riêng cho từng bài. Mở hai ảnh sau khi chạy `--update-goldens`.

Xem bản làm sẵn của cả hai bài trong `flutter_demo/test/`. Dự án kèm theo có 7 Widget Test và 4 Golden Test.
