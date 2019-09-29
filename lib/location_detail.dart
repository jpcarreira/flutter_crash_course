import 'package:flutter/material.dart';
import 'package:flutter_crash_course/models/location.dart' show Location;
import 'package:flutter_crash_course/styles.dart' show Styles;

class LocationDetail extends StatefulWidget {
  final int locationID;

  LocationDetail(this.locationID);

  @override
  State<StatefulWidget> createState() => _LocationDetailState(locationID);
}

class _LocationDetailState extends State<LocationDetail> {
  final int locationID;
  Location location = Location.blank();

  _LocationDetailState(this.locationID);

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          location.name,
          style: Styles.navBarTitle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _renderBody(context, location),
        ),
      ),
    );
  }

  List<Widget> _renderBody(BuildContext context, Location location) {
    var result = List<Widget>();
    result.add(_bannerImage(location, 170.0));
    result.addAll(_renderFacts(location));

    return result;
  }

  Widget _bannerImage(Location location, double height) {
    Image image;

    try {
      if (location.url.isNotEmpty) {
        image = Image.network(location.url, fit: BoxFit.fitWidth);
      }
    } catch (e) {
      print('Could not load image at ${location.url}');
    }

    return Container(
      constraints: BoxConstraints.tightFor(height: height),
      child: image,
    );
  }

  List<Widget> _renderFacts(Location location) {
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
        style: Styles.headerLarge,
      ),
    );
  }

  Widget _sectionText(String text) {
    return Container(
      padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 10.0),
      child: Text(
        text,
        style: Styles.textDefault,
      ),
    );
  }

  void _loadData() async {
    final location = await Location.fetchByID(locationID.toString());
    if (mounted) {
      setState(() {
        this.location = location;
      });
    }
  }
}
