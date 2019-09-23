import 'package:flutter/material.dart';
import 'package:flutter_crash_course/location_detail.dart' show LocationDetail;
import 'package:flutter_crash_course/mocks/mock_location.dart';

void main() {
  return runApp(MaterialApp(home: LocationDetail(MockLocation.FetchAny())));
}
