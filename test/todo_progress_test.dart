import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_progress/todo_progress.dart';

/// 关于flutter  单元测试， 可以参考
/// [flutter test](https://flutter.cn/docs/cookbook/testing/widget/introduction#:~:text=%E4%B8%BA%E4%BA%86%E6%B5%8B%E8%AF%95%20widget%20%E7%B1%BB%EF%BC%8C%E6%88%91%E4%BB%AC%E9%9C%80%E8%A6%81%E4%BD%BF%E7%94%A8%20flutter_test%20package%20%E6%8F%90%E4%BE%9B%E7%9A%84%E9%A2%9D%E5%A4%96%E5%B7%A5%E5%85%B7%EF%BC%8C%E8%BF%99%E4%BA%9B%E5%B7%A5%E5%85%B7%E6%98%AF%E8%B7%9F%20Flutter%20SDK,package%20%E6%8F%90%E4%BE%9B%E4%BA%86%E4%BB%A5%E4%B8%8B%E5%B7%A5%E5%85%B7%E7%94%A8%E4%BA%8E%20widget%20%E7%9A%84%E6%B5%8B%E8%AF%95%EF%BC%9A%20WidgetTester%20%EF%BC%8C%E4%BD%BF%E7%94%A8%E8%AF%A5%E5%B7%A5%E5%85%B7%E5%8F%AF%E5%9C%A8%E6%B5%8B%E8%AF%95%E7%8E%AF%E5%A2%83%E4%B8%8B%E5%BB%BA%E7%AB%8B%20widget%20%E5%B9%B6%E4%B8%8E%E5%85%B6%E4%BA%A4%E4%BA%92%E3%80%82)

void main() {
  testWidgets("test-progress-bar", (tester) async {
    var finish = false;
    var bar = TodoProgressBar(
      onFinish: () {
        print("finish!");
        finish = true;
      },
      finished: 3,
      total: 12,
    );
    await tester.pumpWidget(bar);

    final rate = find.text("3/12");
    final progressBar =
        find.byWidget(const CircularProgressIndicator(value: 3 / 12));

    final stack = find.byWidget(const Stack(
      children: [CircularProgressIndicator(value: 3 / 12), Text("3/12")],
    ));

    expect(rate, findsOneWidget);
    expect(progressBar, findsOneWidget);
    expect(stack, findsOneWidget);

    await tester.longPress(
      find.byWidget(bar),
    );

    await tester.pump();

    expect(finish, true);
  });
}
