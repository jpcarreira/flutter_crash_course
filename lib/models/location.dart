import 'package:flutter_crash_course/models/location_fact.dart'
    show LocationFact;

class Location {
  final String name;
  final String url;
  final List<LocationFact> facts;

  Location({this.name, this.url, this.facts});
}
