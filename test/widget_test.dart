import 'package:flutter_test/flutter_test.dart';
import 'package:excelerate_internship/app.dart';

void main() {
  testWidgets('App starts on the login route', (WidgetTester tester) async {
    await tester.pumpWidget(const ExcelerateLearningApp());

    expect(
      find.text('Welcome back! Please log in to continue.'),
      findsOneWidget,
    );
  });
}
