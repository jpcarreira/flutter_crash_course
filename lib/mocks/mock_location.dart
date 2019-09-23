import 'package:flutter_crash_course/models/location.dart';
import 'package:flutter_crash_course/models/location_fact.dart';

class MockLocation extends Location {
  static Location FetchAny() {
    return Location(name: "Lorem ipsum", url: "http://randomurl.com", facts: [
      LocationFact("Lorem ipsum dolor sit amet",
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
      LocationFact("Lorem ipsum",
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
    ]);
  }
}
