# Chương 18 – Widget Testing

Bộ tài liệu tiếng Việt cho bài thuyết trình khoảng 30 phút, dựa trên Chương 18 của Alejandro Ulate trong *Flutter Apprentice, ấn bản thứ tư* (Kodeco, tr. 540–556). Lời thoại đi theo kịch bản bạn cung cấp và các thao tác trong dự án demo.

## Bắt đầu

1. Mở [PowerPoint](presentation/Chapter18_Widget_Testing.pptx) và điền thông tin người trình bày ở trang bìa. Xem phần Ghi chú hoặc [Kịch bản thuyết trình](presentation/Speaker_Script.md).
2. Chạy [ứng dụng Flutter](flutter_demo/README.md) rồi tập bốn demo theo [Checklist trình bày](classroom/Demo_Checklist.md).
3. Dùng [Hướng dẫn thực hành](classroom/Student_Lab_Guide.md) và [Câu hỏi kèm đáp án](classroom/Quiz_And_Answers.md) để ôn và làm lại sau buổi học.

## Chạy nhanh

Trong PowerShell, mở thư mục chứa README này rồi chạy:

```powershell
Set-Location flutter_demo
flutter pub get
flutter analyze
flutter test
flutter run -d chrome
```

Bộ kiểm thử có 7 bài kiểm tra Widget và 4 bài so sánh ảnh. Ảnh chuẩn được tạo trên Windows với Flutter 3.47.5 và Dart 3.13.4. Dự án được tạo bằng `flutter create` cho web và Android. Nhấn `q` trong Terminal để thoát chế độ chạy.

## Nội dung theo trang sách

| Trang | Nội dung |
| --- | --- |
| 540–541 | Widget Test là gì và vì sao cần kiểm thử |
| 542–545 | Dựng IngredientCard, tìm Widget và tên nguyên liệu |
| 545–548 | Giả lập nhấn và kiểm tra giá trị mà callback nhận |
| 548–550 | Dùng ảnh chuẩn để kiểm tra hình ảnh giao diện |
| 550–554 | Tạo lưới giao diện sáng bằng `golden_toolkit` |
| 555–556 | Thử thách bỏ chọn, kiểm tra giao diện tối và tổng kết |

Ví dụ trong sách nhấn vào thẻ nguyên liệu. Demo nhấn trực tiếp vào Checkbox và kiểm tra cả trạng thái lẫn callback. Sách dùng `golden_toolkit` để chụp lưới. Demo dùng `matchesGoldenFile()` có sẵn và chụp mỗi trường hợp một ảnh riêng.

## Tài liệu tham khảo

- Kodeco, *Flutter Apprentice*, ấn bản thứ tư. Chương 18 do Alejandro Ulate viết, tr. 540–556.
- [Tổng quan kiểm thử trong Flutter](https://docs.flutter.dev/testing/overview)
- [Giới thiệu Widget Testing](https://docs.flutter.dev/cookbook/testing/widget/introduction)
- [Tài liệu API của matchesGoldenFile](https://api.flutter.dev/flutter/flutter_test/matchesGoldenFile.html)
