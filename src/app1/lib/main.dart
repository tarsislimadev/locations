import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp());

class LocationResult {
  final String position;

  LocationResult(this.position);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: NetworkListScreen());
}

class NetworkListScreen extends StatefulWidget {
  @override
  _NetworkListScreenState createState() => _NetworkListScreenState();
}

class _NetworkListScreenState extends State<NetworkListScreen> {
  List<LocationResult> _locations = [];

  @override
  void initState() {
    super.initState();
    _fetchNetworks();
  }

  Future<void> _fetchNetworks() async {
    // PermissionStatus status = await Permission.locationWhenInUse.request();

    // if (status.isGranted) {
      // List<LocationResult> networks = await Wifi.list('');
      setState(() { _locations = []; });
    // }
  }

  void _shareLocation(String _ssid) async {
    // share clicked location with other apps
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Locations v1')),
      body: _locations.isEmpty
          ? Center(child: ElevatedButton(
                onPressed: _fetchNetworks,
                child: Text('No records'),
              ))
          : ListView.builder(
              itemCount: _locations.length,
              itemBuilder: (context, index) => ElevatedButton(
                onPressed: () => _shareLocation(_locations[index].ssid),
                child: Text('Location: ' + _locations[index].ssid),
              ),
          )
    );
  }
}
