# Checklist trình bày

Chạy các lệnh demo tại thư mục `flutter_demo`. Dùng [kịch bản](../presentation/Speaker_Script.md) để biết điểm chuyển slide, mở VS Code và hỏi lớp.

## Trước giờ trình bày

- [ ] Điền thông tin ở trang bìa PowerPoint và mở Ghi chú của người trình bày.
- [ ] Chạy `flutter doctor` và `flutter devices`. Dùng Flutter 3.47.5 trên Windows để đối chiếu ảnh chuẩn đã có.
- [ ] Kiểm tra `lib/main.dart`, `lib/ingredient_card.dart` và hai file kiểm thử trong `test`.
- [ ] Chạy `flutter pub get`, `flutter analyze` và `flutter test`. Kết quả mong đợi là 11 bài đạt. Nếu vừa tạo dự án từ mẫu bộ đếm, chỉ xóa `test/widget_test.dart` khi file đó vẫn chứa bài test bộ đếm của mẫu.
- [ ] Chạy `flutter run -d chrome` ở Terminal thứ nhất. Dùng Terminal thứ hai để chạy test.
- [ ] Mở thư mục `test/goldens` trong VS Code và xem qua bốn ảnh chuẩn.
- [ ] Tập tạo hai lỗi bên dưới, sửa lại và chạy toàn bộ test trước khi lên lớp.

## A. Widget Test chạy đúng · slide 14

- [ ] Trong Chrome, nhấn Sữa tươi hai lần. Chỉ vào tên bị gạch ngang và hai thông báo đã chọn, bỏ chọn.
- [ ] Chạy `flutter test test/ingredient_card_test.dart`. Chỉ vào `+7: All tests passed!`.

## B. Lỗi thao tác và cách sửa · slide 15–16

- [ ] Trong `lib/ingredient_card.dart`, vào `updateChecked()`, đổi `isChecked = newValue;` thành `isChecked = false;` rồi lưu.
- [ ] Hỏi lớp dự đoán bài kiểm tra tên và bài kiểm tra nhấn. Chạy `flutter test test/ingredient_card_test.dart`.
- [ ] Chỉ vào bài «nhấn vào ô chưa chọn để đánh dấu». Đọc `Expected: true` và `Actual: <false>`. Bản demo này có ba bài thất bại.
- [ ] Khôi phục `isChecked = newValue;`, lưu, chạy lại và chỉ vào bảy bài đạt.

## C. Golden Test chạy đúng · slide 20

- [ ] Mở `test/ingredient_golden_test.dart`. Chỉ vào kích thước cố định, `RepaintBoundary` và `matchesGoldenFile(file)`.
- [ ] Mở ảnh trong `test/goldens`. Chạy `flutter test test/ingredient_golden_test.dart` và chỉ vào bốn bài đạt.
- [ ] Giải thích lệnh `flutter test --update-goldens test/ingredient_golden_test.dart` dùng để tạo hoặc cập nhật ảnh chuẩn đã duyệt. Bản demo đã có sẵn ảnh.

## D. Lỗi màu nền và cách sửa · slide 20

- [ ] Trong `Material`, đổi `color: rowColor,` thành `color: Colors.red,` rồi lưu.
- [ ] Cho lớp dự đoán các bài nào sẽ báo lỗi. Chạy `flutter test test/ingredient_golden_test.dart`. Cả bốn bài báo sai khác pixel.
- [ ] Mở các ảnh `masterImage`, `testImage` và `isolatedDiff` trong `test/failures`. Hỏi vùng nào đã thay đổi.
- [ ] Khôi phục `color: rowColor,` và lưu. Chạy lại lệnh so sánh để thấy bốn bài đạt.

## Kết thúc

- [ ] Chạy `flutter test` và xác nhận 11 bài đạt, hai dòng sửa tạm đã được khôi phục.
- [ ] Mời lớp trả lời câu hỏi nhanh. Chỉ cho các bạn nơi mở hướng dẫn thực hành và câu hỏi kèm đáp án.
