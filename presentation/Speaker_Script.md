# Chương 18 – Widget Testing

Lời thoại dựa trên phần kịch bản bạn cung cấp, được chia theo 25 slide. Thời lượng khoảng 30 phút, gồm bốn demo. Điền thông tin ở trang bìa. Mở ứng dụng Flutter, VS Code và Terminal trước giờ trình bày.

Gợi ý chia giờ: khoảng 6 phút cho phần mở đầu và khái niệm, 7 phút đọc mã, 12 phút demo và 5 phút hỏi đáp, tổng kết. Nội dung trong ngoặc vuông là lời nhắc cho người trình bày.

## 1. Chương 18 – Widget Testing

**0:55 · Chào lớp và đặt câu hỏi**

Chào thầy và các bạn. Hôm nay mình sẽ trình bày Chương 18 – Widget Testing trong Flutter. Trước khi đi vào bài, mình có một câu hỏi. Khi các bạn code xong một nút bấm trên ứng dụng Flutter, làm sao biết nút đó hoạt động chính xác? [Dừng một chút để nghe câu trả lời.]

*Nguồn* — Alejandro Ulate, Flutter Apprentice, ấn bản thứ tư, tr. 540–556.

## 2. Mục tiêu bài học

**0:40 · Giới thiệu mục tiêu**

Hôm nay mình sẽ giải thích Widget Test bằng một danh sách công việc, sau đó đưa ví dụ đó vào ứng dụng danh sách nguyên liệu. Mình sẽ cùng các bạn đọc code, chạy thử, cố tình tạo lỗi rồi xem Flutter phát hiện lỗi như thế nào.

*Nguồn* — Dựa trên phần mở đầu và mục tiêu trong đoạn bạn cung cấp.

## 3. Vì sao cần kiểm thử?

**0:55 · Dùng ví dụ công việc**

Thông thường chúng ta sẽ chạy ứng dụng, dùng chuột hoặc điện thoại nhấn nút để kiểm tra. Nhưng nếu ứng dụng có hàng trăm nút và hàng chục màn hình thì sao? Hãy nhìn ví dụ trên slide. Mình đánh dấu «Làm bài tập Flutter». Ô đã được chọn, nhưng chữ vẫn chưa bị gạch ngang. [Hỏi lớp: còn dấu hiệu nào cho thấy công việc đã hoàn thành?] Đó là lý do chúng ta sử dụng Widget Testing.

*Nguồn* — Ví dụ danh sách công việc từ đoạn bạn cung cấp. Chương 18, tr. 540–541.

## 4. Widget là gì?

**0:40 · Chỉ vào các ví dụ**

Trong Flutter, gần như mọi thành phần giao diện đều được xây dựng từ Widget. Text hiển thị chữ, ElevatedButton tạo nút bấm, Checkbox tạo ô đánh dấu và TextField cho phép nhập nội dung. Scaffold tạo cấu trúc cơ bản để mình đặt thanh tiêu đề và phần nội dung.

*Nguồn* — Giải thích bổ sung từ đoạn bạn cung cấp.

## 5. Widget Testing là gì?

**0:45 · Chỉ theo sơ đồ**

Ví dụ chúng ta có một danh sách nguyên liệu cần mua. Khi nhấn vào ô Checkbox, nguyên liệu phải được đánh dấu hoàn thành. Widget Test giúp mình tự động kiểm tra việc này. Flutter dựng Widget trong môi trường kiểm thử, giả lập hành động nhấn, rồi kiểm tra trạng thái có thực sự thay đổi hay không. Nếu đúng, test PASS. Nếu sai, test FAIL.

*Nguồn* — Chương 18, tr. 540–541.

## 6. Unit Test, Widget Test và Integration Test

**0:50 · Dùng ví dụ đặt món**

Giả sử mình viết ứng dụng đặt món. Một Unit Test kiểm tra phép tính tổng tiền, chẳng hạn 100 cộng 50 bằng 150. Một Widget Test nhấn nút dấu cộng rồi xem số lượng trên màn hình có tăng không. Một Integration Test đi qua cả luồng đăng nhập, đặt món và thanh toán. Nếu bấm dấu cộng mà số lượng vẫn đứng yên, các bạn sẽ chọn loại test nào? [Chờ trả lời.]

*Nguồn* — Ví dụ ứng dụng đặt món từ đoạn bạn cung cấp. https://docs.flutter.dev/testing/overview

## 7. Arrange – Act – Assert

**0:55 · Giải thích ba bước**

Cách xây dựng một bài test gồm ba bước. Arrange là chuẩn bị. Mình tạo một Checkbox chưa được chọn, giá trị là false. Act là thực hiện hành động. Mình cho tester nhấn ô đó một lần. Assert là kiểm tra kết quả. Mình kiểm tra xem giá trị mới có bằng true không. Mỗi bước trả lời một câu hỏi. Chuẩn bị gì, làm gì và kết quả ra sao?

*Nguồn* — Chương 18, tr. 543–544 và 547–548.

## 8. Các hàm kiểm thử quan trọng

**1:30 · Đọc code trên slide**

testWidgets khai báo bài kiểm thử và cho mình một tester. pumpWidget dựng giao diện. find.text tìm theo chữ, còn find.byType tìm theo loại Widget, như Checkbox. Hãy tưởng tượng tester là một người dùng ảo. tester.tap cho người dùng đó nhấn và pumpAndSettle vẽ các frame cho đến khi giao diện ổn định. Cuối cùng expect giống như giám khảo, kiểm tra kết quả thực tế. findsOneWidget yêu cầu đúng một kết quả. findsNothing là không tìm thấy, findsWidgets là có ít nhất một kết quả, còn findsNWidgets kiểm tra đúng số lượng mình đưa vào. isTrue dùng để kiểm tra giá trị true. Dấu ba chấm ở ví dụ testWidgets đại diện cho phần thân của bài test.

*Nguồn* — Chương 18, tr. 543–548. https://docs.flutter.dev/cookbook/testing/widget/introduction

## 9. IngredientCard trong sách

**1:00 · Chỉ vào thẻ nguyên liệu**

Trong demo, mình xây dựng một Widget tên là IngredientCard, tương tự ví dụ trong sách. Sách dùng nguyên liệu colby jack cheese. Demo của mình dùng Sữa tươi, Trứng gà và Phô mai. name là tên nguyên liệu. initiallyChecked là giá trị ban đầu. evenRow đổi kiểu hiển thị dòng, còn showCheckbox quyết định có hiện ô hay không. onChecked là hàm được gọi khi giá trị thay đổi.

*Nguồn* — Chương 18, tr. 542–543 và 545–548. Hình minh họa danh sách tự dựng.

## 10. IngredientCard hoạt động thế nào?

**1:15 · Mở lib/ingredient_card.dart**

Đây là StatefulWidget vì giá trị đánh dấu có thể thay đổi. Trong initState, mình lấy initiallyChecked làm giá trị ban đầu. Khi người dùng nhấn Checkbox, hàm updateChecked nhận giá trị mới. setState lưu giá trị và báo cho Flutter vẽ lại ô và dòng chữ. Nếu isChecked là true, TextDecoration.lineThrough gạch ngang tên. Sau đó onChecked chuyển giá trị mới cho Widget cha. Khi chạy app, mình sẽ chỉ vào dòng thông báo đó.

*Nguồn* — Bản cài đặt của demo. Chương 18, tr. 542 và 545–548.

## 11. Widget Test đầu tiên

**1:10 · Mở test/ingredient_card_test.dart**

Trong file kiểm thử, mình dùng testWidgets để tạo bài test rồi dùng pumpWidget để dựng giao diện. wrapCard bọc thẻ bằng MaterialApp và Scaffold để có môi trường giống một màn hình Flutter. find.text tìm chữ «Sữa tươi» và expect với findsOneWidget kiểm tra đúng một kết quả. Bài đầu tiên trong sách kiểm tra cả Widget và tên nguyên liệu. Trong demo, hai điều này có hai bài kiểm thử riêng.

*Nguồn* — Chương 18, tr. 542–545. Mã lấy từ dự án kèm theo.

## 12. Kiểm thử thao tác nhấn

**1:05 · Chỉ vào Finder, thao tác và kết quả**

Ở phần hành vi, sách giả lập nhấn vào thẻ và kiểm tra giá trị gửi qua onChecked. Trong demo mình nhấn trực tiếp vào Checkbox. find.byType tìm đúng loại Widget, tester.tap giả lập nhấn, và pumpAndSettle đợi Flutter dựng xong các frame. Sau đó mình đọc Checkbox.value. Theo các bạn, giá trị phải là true hay false? [Chờ trả lời.] True. Một bài riêng kiểm tra callback báo cả true lẫn false.

*Nguồn* — Chương 18, tr. 545–548. Mã lấy từ dự án kèm theo.

## 13. Kiểm thử thao tác bỏ chọn

**1:00 · Chỉ vào initiallyChecked**

Đổi câu hỏi theo chiều ngược lại. Nếu ban đầu nguyên liệu đã được chọn, một lần nhấn phải bỏ chọn. Đây là thử thách 1 ở trang 555. Trong bài test, initiallyChecked là true. Sau khi nhấn, mình kiểm tra Checkbox có giá trị false và danh sách reported chứa đúng một giá trị false. Như vậy mình kiểm tra cả giao diện và thông báo gửi cho Widget cha.

*Nguồn* — Chương 18, tr. 555.

## 14. Demo 1 – Chạy Widget Test

**1:50 · Mở Chrome và Terminal của VS Code**

Bây giờ mình sẽ chạy các bài kiểm thử. Trước hết, trên Chrome, nhấn vào ô của Sữa tươi. Các bạn thấy dấu chọn, chữ bị gạch ngang và dòng thông báo «Sữa tươi đã được chọn». Nhấn lại để xem «Sữa tươi đã bỏ chọn». Sau đó, chuyển sang Terminal đang ở flutter_demo và chạy flutter test test/ingredient_card_test.dart. Quan sát Terminal. Khi mọi thứ đúng, dòng cuối hiện +7 và All tests passed! Chạy Widget Test không cần mở Chrome.

*Nguồn* — Demo A của dự án kèm theo.

## 15. Demo 2 – Cố tình làm test lỗi

**2:00 · Sửa tạm code và chạy lại**

Tiếp theo, mình sẽ cố tình sửa code để Checkbox luôn trả về false. Trong lib/ingredient_card.dart, tìm updateChecked. Đổi đúng dòng isChecked = newValue; thành isChecked = false; rồi lưu. Các bạn thử đoán. Bài kiểm tra tên còn đạt không? Bài kiểm tra thao tác nhấn thì sao? Chạy lại flutter test test/ingredient_card_test.dart. Chỉ vào Expected: true và Actual: <false>. Bài test phát hiện lỗi vì mình nhấn chọn nhưng code giữ giá trị false. Trong bản demo này, ba bài thất bại.

*Nguồn* — Demo B của dự án kèm theo.

## 16. Sửa lỗi và chạy lại

**1:00 · Khôi phục code và kiểm thử**

Đổi dòng đó về isChecked = newValue; rồi lưu. Mình chạy lại đúng lệnh lúc nãy. Bây giờ cả bảy bài đều PASS. Các bạn vừa thấy cả quá trình. Ban đầu code đúng, sau đó mình đưa lỗi vào, bài test báo lỗi và mình sửa lại. Đây là cách dùng bài test để kiểm tra bản sửa.

*Nguồn* — Demo B của dự án kèm theo.

## 17. Golden Testing là gì?

**1:00 · Nêu tình huống đổi màu**

Giả sử nút vẫn nhận thao tác nhấn, nhưng một lần sửa code làm màu nền của nó đổi từ xanh sang đỏ. Bài kiểm tra hành vi có thể vẫn PASS. Golden Test so sánh hình ảnh giao diện hiện tại với một ảnh chuẩn đã được duyệt. Nó giúp mình phát hiện thay đổi về hình ảnh, chẳng hạn màu nền hoặc vị trí của chữ. Trong hình minh họa trên slide, tên và ô đánh dấu giữ nguyên nhưng nền đã đổi màu.

*Nguồn* — Chương 18, tr. 548–549. Tình huống đổi màu từ đoạn bạn cung cấp.

## 18. Golden Testing hoạt động thế nào?

**1:00 · Chỉ theo luồng so sánh**

Đầu tiên mình dựng Widget. Khi biết giao diện đã đúng, mình lưu hình làm mốc. Ở lần chạy sau, Flutter vẽ lại cùng Widget và so sánh các pixel. Khớp thì PASS, khác thì FAIL với cấu hình mặc định của demo. Mở ảnh khác biệt để xem phần nào đã thay đổi.

*Nguồn* — Chương 18, tr. 548–550 và 553–554. https://api.flutter.dev/flutter/flutter_test/matchesGoldenFile.html

## 19. Golden Testing trong sách

**1:25 · Chỉ vào bốn ô của lưới**

Sách dùng golden_toolkit. GoldenBuilder.grid tạo một lưới hai cột và addScenario thêm từng tình huống. Trong giao diện sáng, tác giả kết hợp dòng chẵn hoặc lẻ với ô đã chọn hoặc chưa chọn. pumpWidgetBuilder dựng lưới trong materialAppWrapper để dùng đúng Theme. Cuối cùng screenMatchesGolden so sánh cả lưới với một ảnh chuẩn. Bản demo của lớp dùng matchesGoldenFile có sẵn trong flutter_test và lưu mỗi trường hợp một ảnh PNG.

*Nguồn* — Chương 18, tr. 549–553.

## 20. Demo Golden Test

**3:25 · Chạy demo C và D trong VS Code**

Mở test/ingredient_golden_test.dart. Chỉ vào RepaintBoundary và matchesGoldenFile. Mở ảnh chuẩn trong test/goldens, rồi chạy flutter test test/ingredient_golden_test.dart. Cả bốn bài phải đạt. Tiếp theo, trong Material của IngredientCard, đổi color: rowColor, thành color: Colors.red, rồi lưu. Trước khi chạy lại, hỏi lớp: bài kiểm tra nhấn Checkbox có còn đạt không, và bài so sánh ảnh thì sao? Chạy lại lệnh Golden Test. Bốn bài báo Pixel test failed. Mở các ảnh masterImage, testImage và isolatedDiff trong test/failures để chỉ vùng màu thay đổi. Khôi phục color: rowColor, rồi chạy lại. Cả bốn bài đạt. --update-goldens dùng để tạo ảnh chuẩn ban đầu hoặc ghi ảnh mới sau khi đã duyệt thay đổi.

*Nguồn* — Demo C và D của dự án kèm theo. https://api.flutter.dev/flutter/flutter_test/matchesGoldenFile.html

## 21. Giao diện sáng và giao diện tối

**1:00 · Chỉ vào các PNG thật**

Thử thách 2 ở cuối chương yêu cầu kiểm tra giao diện tối cho cả hai trạng thái, đã chọn và chưa chọn. Trong dự án của lớp, bốn ảnh đang chiếu là ảnh chuẩn thật. Nhìn ảnh tối đã chọn. Dấu chọn và tên bị gạch ngang đều cần dễ thấy. Ở đây màu được lấy từ ColorScheme của Theme hiện tại.

*Nguồn* — Chương 18, tr. 555. Các PNG được tạo bởi demo.

## 22. Các lỗi thường gặp

**1:05 · Hỏi lớp cách xử lý**

Nếu mình nhấn xong mà đọc Widget trước khi pump, mình có thể thấy giá trị cũ. Nếu Finder sai hoặc giá trị mong đợi sai thì bài test cũng có thể báo lỗi. Khi Golden Test thất bại, mở ảnh khác biệt trước. Chỉ dùng --update-goldens nếu cả nhóm đã chấp nhận thiết kế mới. Khi so sánh ảnh, nên dùng cùng bản Flutter, font và kích thước.

*Nguồn* — Phần xử lý lỗi từ đoạn bạn cung cấp. https://api.flutter.dev/flutter/flutter_test/matchesGoldenFile.html

## 23. Ví dụ ứng dụng thực tế

**0:45 · Mời lớp nêu ví dụ**

Nếu nhóm bạn làm ứng dụng đặt món, thử viết một bài nhấn dấu cộng rồi kiểm tra số lượng. Với danh sách công việc, thử kiểm tra tên có bị gạch ngang sau khi đánh dấu. Với màn hình xác nhận thanh toán, ảnh chuẩn giúp mình kiểm tra hình thức của thông báo thành công. [Mời một bạn nêu ví dụ từ đồ án của mình.]

*Nguồn* — Ví dụ từ đoạn bạn cung cấp.

## 24. Câu hỏi nhanh

**1:40 · Dừng để lớp chọn đáp án**

Cho các bạn khoảng ba mươi giây để chọn A hoặc B. [Chờ lớp.] Câu 1 là B, Widget Test. Câu 2 là A, pumpWidget dựng giao diện. Câu 3 là B, Assert kiểm tra kết quả. Câu 4 là A, ảnh tham chiếu. Câu 5 là B, xem ảnh khác biệt trước khi quyết định cập nhật mẫu hay sửa code. Nếu còn thời gian, mời lớp hỏi thêm. Bộ câu hỏi đi kèm có phần thầy và các bạn thường hỏi.

*Nguồn* — Đáp án của năm câu trên slide.

## 25. Tổng kết

**1:10 · Kết luận và giao bài thực hành**

Sau Chương 18, chúng ta cần nhớ ba điều. Thứ nhất, Widget Test giúp kiểm tra cách các thành phần giao diện hoạt động. Thứ hai, Arrange – Act – Assert giúp chúng ta viết bài kiểm thử rõ ràng và dễ đọc lại. Thứ ba, Golden Test giúp phát hiện những thay đổi không mong muốn về mặt hình ảnh. Nhờ những kỹ thuật này, chúng ta có thể hạn chế lỗi, giảm thời gian kiểm tra thủ công và tự tin hơn mỗi khi sửa ứng dụng. Các bạn có thể mở hướng dẫn thực hành và chạy lại cả hai tình huống tạo lỗi. Hãy kiểm thử Widget trước khi người dùng phát hiện lỗi.

*Nguồn* — Lời kết dựa trên đoạn bạn cung cấp. Chương 18, tr. 556.
