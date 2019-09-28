import "package:json_annotation/json_annotation.dart";
import 'package:flutter_crash_course/models/location_fact.dart'
    show LocationFact;

part 'location.g.dart';

@JsonSerializable()
class Location {
  final String name;
  final String url;
  final List<LocationFact> facts;

  Location({this.name, this.url, this.facts});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
