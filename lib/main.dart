import 'package:flutter/material.dart';
import 'package:flutter_crash_course/location_list.dart' show LocationList;
import 'package:flutter_crash_course/mocks/mock_location.dart'
    show MockLocation;

void main() {
  return runApp(MaterialApp(home: LocationList(MockLocation.FetchAll())));
}
