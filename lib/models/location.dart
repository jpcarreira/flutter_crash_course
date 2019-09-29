import "package:json_annotation/json_annotation.dart";
import 'package:flutter_crash_course/models/location_fact.dart'
    show LocationFact;
import "dart:async";
import "dart:convert";
import "package:http/http.dart" as http;
import "package:flutter_crash_course/endpoint.dart";

part 'location.g.dart';

@JsonSerializable()
class Location {
  final int id;
  final String name;
  final String url;
  final List<LocationFact> facts;

  Location({this.id, this.name, this.url, this.facts});

  Location.blank()
      : id = 0,
        name = "",
        url = "",
        facts = [];

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  static Future<List<Location>> fetchAll() async {
    var uri = Endpoint.uri("/locations");

    final response = await http.get(uri.toString());

    if (response.statusCode != 200) {
      throw response.body;
    }

    List<Location> locationsList = new List<Location>();

    for (var locationItem in json.decode(response.body)) {
      locationsList.add(Location.fromJson(locationItem));
    }

    return locationsList;
  }

  static Future<Location> fetchByID(String locationId) async {
    var uri = Endpoint.uri("/locations/$locationId");

    final response = await http.get(uri.toString());

    if (response.statusCode != 200) {
      throw response.body;
    }

    final Map<String, dynamic> locationJson = json.decode(response.body);

    return Location.fromJson(locationJson);
  }
}
