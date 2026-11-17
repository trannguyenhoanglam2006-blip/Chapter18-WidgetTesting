# Danh sách nguyên liệu

Ứng dụng có ba nguyên liệu là Sữa tươi, Trứng gà và Phô mai. Khi nhấn một Checkbox, ô chuyển trạng thái và tên nguyên liệu được gạch ngang hoặc trở về bình thường. Dòng dưới danh sách báo trạng thái mà Widget cha nhận qua `onChecked`.

## Chạy ứng dụng

Để dùng cùng môi trường tạo ảnh chuẩn, chọn Flutter 3.47.5 và Dart 3.13.4 trên Windows. Mở Terminal tại thư mục `flutter_demo`.

```powershell
flutter --version
flutter doctor
flutter devices
flutter pub get
flutter run -d chrome
```

Có thể dùng `flutter run -d edge` hoặc chọn thiết bị Android xuất hiện trong `flutter devices`. Nếu phòng học không truy cập được CDN của trình kết xuất web, dùng `flutter run -d chrome --no-web-resources-cdn`. Nhấn `q` trong Terminal để thoát. Mở Terminal thứ hai để chạy test khi app đang mở.

## Chạy kiểm thử

```powershell
flutter analyze
flutter test test/ingredient_card_test.dart
flutter test test/ingredient_golden_test.dart
flutter test
```

Bảy Widget Test kiểm tra thẻ, tên, trạng thái ban đầu, thao tác chọn và bỏ chọn, giá trị callback và kiểu gạch ngang. Bốn Golden Test kiểm tra một dòng chẵn trong giao diện sáng và tối, mỗi giao diện có trạng thái đã chọn và chưa chọn.

Golden Test cố định khung nhìn 400 × 200, tỉ lệ điểm ảnh 1, vùng chụp rộng 320 và font Roboto đi kèm. `RepaintBoundary` giới hạn vùng chụp ở thẻ. Bốn ảnh chuẩn nằm trong `test/goldens`.

```powershell
flutter test --update-goldens test/ingredient_golden_test.dart
flutter test test/ingredient_golden_test.dart
```

Lệnh có `--update-goldens` dùng để tạo ảnh còn thiếu hoặc lưu mẫu mới khi đã duyệt thay đổi thiết kế. Hãy mở ảnh để kiểm tra trước khi dùng làm mốc. Phiên bản Flutter và hệ điều hành có thể ảnh hưởng đến kết quả so sánh pixel. Nếu thấy khác biệt trên máy khác, xem các ảnh so sánh trước khi cập nhật ảnh chuẩn.

## Thử hai lỗi để trình bày

| Lỗi | Dòng sửa tạm trong `lib/ingredient_card.dart` | Lệnh kiểm tra |
| --- | --- | --- |
| Lỗi thao tác | Trong `updateChecked`, đổi `isChecked = newValue;` thành `isChecked = false;` | `flutter test test/ingredient_card_test.dart` |
| Lỗi hình ảnh | Trong `Material`, đổi `color: rowColor,` thành `color: Colors.red,` | `flutter test test/ingredient_golden_test.dart` |

Với lỗi thao tác, bài kiểm tra nhấn mong `true` nhưng đọc được `false`. Với lỗi hình ảnh, cả bốn bài báo khác pixel. Xem ảnh so sánh trong `test/failures`. Sau mỗi demo, khôi phục dòng đúng rồi chạy lại lệnh tương ứng.

## Cách làm trong sách và trong demo

Sách dùng `golden_toolkit` để lưu bốn tình huống giao diện sáng trong một lưới. Demo dùng `flutter_test` để so sánh một ảnh cho mỗi trường hợp, đồng thời kiểm tra hai trạng thái của giao diện tối từ thử thách 2.

Xem thông tin và giấy phép font tại [assets/fonts/LICENSE.txt](assets/fonts/LICENSE.txt).
