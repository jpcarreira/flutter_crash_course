import 'package:flutter_test/flutter_test.dart';
import "package:test/test.dart" as test_prefix;
import 'package:flutter_crash_course/mocks/mock_location.dart';

void main() {
  test_prefix.test("test fetchAny", () {
    final location = MockLocation.FetchAny();
    expect(location, isNotNull);
    expect(location.name, isNotEmpty);
  });

  test_prefix.test("test fetchAll", () {
    final locations = MockLocation.FetchAll();
    expect(locations.length, greaterThan(0));
    expect(locations[0].name, isNotEmpty);
  });

  test_prefix.test("test fetch", () {
    final location = MockLocation.Fetch(0);
    expect(location, isNotNull);
    expect(location.name, isNotEmpty);
  });
}
