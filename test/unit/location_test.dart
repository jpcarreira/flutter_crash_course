import "package:test/test.dart";
import "dart:convert";
import 'package:flutter_crash_course/models/location.dart';

void main() {
  test("test location deserialization", () {
    const locationJson = '''
      {
        "name": "Lorem ipsum",
        "url": "https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
        "facts": [
          {
            "title": "Lorem ipsum dolor sit amet",
            "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
          },
          {
            "title": "Lorem ipsum",
            "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
          }
        ]
      }
    ''';

    final locationMap = json.decode(locationJson) as Map<String, dynamic>;
    expect("Lorem ipsum", equals(locationMap["name"]));

    final location = Location.fromJson(locationMap);
    expect(location.name, equals(locationMap["name"]));
    expect(location.url, equals(locationMap["url"]));
    expect(location.facts.length, equals(2));
    expect(location.facts[0].title, equals(locationMap["facts"][0]["title"]));
    expect(location.facts[0].text, equals(locationMap["facts"][0]["text"]));
    expect(location.facts[1].title, equals(locationMap["facts"][1]["title"]));
    expect(location.facts[1].text, equals(locationMap["facts"][1]["text"]));
  });
}
