# Câu hỏi ôn tập và đáp án

| Câu hỏi | Đáp án và giải thích |
| --- | --- |
| 1. Widget Test kiểm tra được gì? | Widget có dựng được và phản hồi đúng trước thao tác. Ví dụ, nhấn ô và đọc trạng thái mới. |
| 2. Nên dùng loại kiểm thử nào cho hàm cộng giá tiền? | Unit Test. Có thể chạy hàm Dart riêng. |
| 3. Kiểm tra luồng đăng nhập, đặt món và thanh toán bằng gì? | Integration Test. Bài kiểm thử đi qua nhiều phần của ứng dụng. |
| 4. Arrange, Act và Assert nghĩa là gì? | Chuẩn bị dữ liệu và Widget, thực hiện thao tác, rồi xác nhận kết quả. |
| 5. `pumpWidget()` làm gì? | Dựng cây Widget trong môi trường kiểm thử. |
| 6. `tester.tap(checkbox)` làm gì? | Giả lập thao tác nhấn vào Widget mà Finder `checkbox` tìm được. |
| 7. `expect(checkbox, findsOneWidget)` xác nhận điều gì? | Finder tìm được đúng một Widget. Muốn biết ô đã chọn chưa, đọc `Checkbox.value`. |
| 8. Tìm chữ «Sữa tươi» bằng lệnh nào? | `find.text('Sữa tươi')`. Hàm tìm Widget có nội dung chữ tương ứng. |
| 9. Một ô bắt đầu ở trạng thái đã chọn. Nhấn một lần thì `onChecked` nhận gì? | `false`. Ô chuyển sang bỏ chọn và gửi giá trị mới cho Widget cha. |
| 10. Ảnh Golden là gì? | Ảnh đã được duyệt và lưu làm mẫu để đối chiếu với hình ảnh Flutter vẽ ở lần chạy sau. |
| 11. Nên làm gì trước nếu Golden Test báo sai khác? | Mở ảnh chuẩn, ảnh hiện tại và ảnh khác biệt. Dùng chúng để xác định nên sửa code hay duyệt thiết kế mới. |
| 12. Vì sao test đọc giá trị cũ sau khi nhấn? | Có thể chưa pump. Dùng `await tester.pumpAndSettle()` để chờ các frame cập nhật. |
| 13. Vì sao Golden Test dùng cùng font và kích thước? | Hai yếu tố này có thể làm thay đổi pixel dù chức năng vẫn hoạt động. |

## Đáp án của slide 24

1. **B** · Widget Test.
2. **A** · `pumpWidget()`.
3. **B** · Assert.
4. **A** · Ảnh chuẩn.
5. **B** · Xem ảnh khác biệt.

## Câu hỏi thầy hoặc các bạn có thể đặt ra

**Widget Test có thay thế hoàn toàn việc test thủ công không?**  
Widget Test tự động kiểm tra các tình huống mình đã viết. Dùng thử bằng tay vẫn giúp đánh giá trải nghiệm tổng thể và tìm các tình huống mới.

**Widget Test có cần chạy ứng dụng trên điện thoại không?**  
Chạy `flutter test` trên máy phát triển là đủ cho demo. Flutter dựng Widget trong môi trường kiểm thử riêng.

**Tại sao phải dùng `pumpAndSettle()` sau `tester.tap()`?**  
Nhấn có thể lên lịch cho các frame mới. `pumpAndSettle()` xử lý các frame đó đến khi giao diện ổn định. Với bài test chỉ cần một frame, `pump()` có thể đủ.

**Golden Test khác Widget Test kiểm tra hành vi thế nào?**  
Golden Test so sánh ảnh render với mẫu đã lưu. Bài kiểm tra hành vi đọc những kết quả như `Checkbox.value` hoặc giá trị callback. Có thể dùng cả hai cho cùng Widget.

**Nếu cố ý đổi thiết kế thì xử lý Golden Test thất bại thế nào?**  
Xem ảnh khác biệt, xác nhận thay đổi đã đúng thiết kế rồi chạy `--update-goldens`. Kiểm tra ảnh mới và chạy lại bài test bình thường.

**Ứng dụng dùng Firebase hoặc API có viết Widget Test được không?**  
Có. Có thể truyền nguồn dữ liệu giả để dựng các trạng thái như đang tải, thành công hoặc lỗi. Bài kiểm thử luồng với dịch vụ thật có thể dùng một môi trường riêng.
