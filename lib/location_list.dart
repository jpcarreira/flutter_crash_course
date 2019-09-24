import 'package:flutter/material.dart';
import 'package:flutter_crash_course/location_detail.dart' show LocationDetail;
import 'package:flutter_crash_course/models/location.dart' show Location;
import 'package:flutter_crash_course/styles.dart' show Styles;

class LocationList extends StatelessWidget {
  final List<Location> locations;

  LocationList(this.locations);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Locations",
            style: Styles.navBarTitle,
          ),
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: _listViewItemBuilder,
        ));
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    return ListTile(
      leading: _itemThumbnail(locations[index]),
      title: _itemTitle(locations[index]),
      contentPadding: EdgeInsets.all(10),
      onTap: () => _navigatoToLocationDetail(context, index),
    );
  }

  Future _navigatoToLocationDetail(BuildContext context, int index) {
    return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationDetail(locations[index]),
        ));
  }

  Widget _itemThumbnail(Location location) {
    return Container(
      constraints: BoxConstraints.tightFor(width: 100),
      child: Image.network(
        location.url,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _itemTitle(Location location) {
    return Text(
      '> ${location.name}',
      style: Styles.textDefault,
    );
  }
}
