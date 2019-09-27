import 'package:flutter/material.dart';
import 'package:flutter_crash_course/mocks/mock_location.dart';
import 'package:flutter_test/flutter_test.dart';
import "package:flutter_crash_course/app.dart";
import "package:image_test_utils/image_test_utils.dart";

void main() {
  testWidgets('test app startup', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(App());

      final mockLocation = MockLocation.FetchAny();
      expect(find.text('> ${mockLocation.name}'), findsWidgets);
    });
  });
}
