import 'package:flutter/material.dart';
import 'package:flutter_crash_course/models/location.dart' show Location;

class LocationDetail extends StatelessWidget {
  final Location location;

  LocationDetail(this.location);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _renderBody(context),
      ),
    );
  }

  List<Widget> _renderBody(BuildContext context) {
    var result = List<Widget>();
    result.add(_bannerImage(170.0));
    result.addAll(_renderFacts());

    return result;
  }

  Widget _bannerImage(double height) {
    return Container(
      constraints: BoxConstraints.tightFor(height: height),
      child: Image.network(location.url, fit: BoxFit.fitWidth),
    );
  }

  List<Widget> _renderFacts() {
    var result = List<Widget>();
    for (int i = 0; i < location.facts.length; i++) {
      result.add(_sectionTitle(location.facts[i].title));
      result.add(_sectionText(location.facts[i].text));
    }

    return result;
  }

  Widget _sectionTitle(String text) {
    return Container(
      padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 10.0),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 25.0, color: Colors.black),
      ),
    );
  }

  Widget _sectionText(String text) {
    return Container(
      padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 10.0),
      child: Text(text),
    );
  }
}
