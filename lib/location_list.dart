import 'package:flutter/material.dart';
import 'package:flutter_crash_course/location_detail.dart' show LocationDetail;
import 'package:flutter_crash_course/models/location.dart' show Location;
import 'package:flutter_crash_course/styles.dart' show Styles;

class LocationList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  List<Location> locations = [];
  bool isLoading = false;

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
            "Locations",
            style: Styles.navBarTitle,
          ),
        ),
        body: RefreshIndicator(
          onRefresh: _loadData,
          child: Column(
            children: [
              _renderProgressBar(context),
              Expanded(
                child: _renderListView(context),
              ),
            ],
          ),
        ));
  }

  Widget _renderProgressBar(BuildContext context) {
    return isLoading
        ? LinearProgressIndicator(
            value: null,
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
          )
        : Container();
  }

  ListView _renderListView(BuildContext context) {
    return ListView.builder(
      itemCount: locations.length,
      itemBuilder: _listViewItemBuilder,
    );
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    return ListTile(
      leading: _itemThumbnail(locations[index]),
      title: _itemTitle(locations[index]),
      contentPadding: EdgeInsets.all(10),
      onTap: () => _navigatoToLocationDetail(context, locations[index].id),
    );
  }

  Future _navigatoToLocationDetail(BuildContext context, int locationID) {
    return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationDetail(locationID),
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
      location.name,
      style: Styles.textDefault,
    );
  }

  Future<void> _loadData() async {
    setState(() => isLoading = true);
    final locations = await Location.fetchAll();
    setState(() {
      this.locations = locations;
      isLoading = false;
    });
  }
}
