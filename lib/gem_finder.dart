import 'package:flutter/material.dart';
import 'travel_details.dart';
import 'package:geolocator/geolocator.dart';
import 'api.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

//function for getting the location access
Future<Position> getCurrentLocation() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied.');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error('Location permissions are permanently denied.');
  }

  return await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
}

//page which gets the location access and navigates to next page
class LocationAccess extends StatelessWidget {
  Future<void> _handleLocation(BuildContext context) async {
    try {
      Position position = await getCurrentLocation();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NearbyPlacesPage(
            latitude: position.latitude,
            longitude: position.longitude,
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to get location: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Access'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _handleLocation(context),
          child: Text('Get Current Location'),
        ),
      ),
    );
  }
}

// main page which shows the list of nearby places
class NearbyPlacesPage extends StatefulWidget {
  final double latitude;
  final double longitude;

  const NearbyPlacesPage({
    required this.latitude,
    required this.longitude,
    Key? key,
  }) : super(key: key);

  @override
  _NearbyPlacesPageState createState() => _NearbyPlacesPageState();
}

class _NearbyPlacesPageState extends State<NearbyPlacesPage> {
  late Future<List> _placesFuture;

  @override
  void initState() {
    super.initState();
    _placesFuture = fetchNearbyPlaces(widget.latitude, widget.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nearby Places"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: Text('Leaderboard'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LeaderboardPage()),
                );
              },
            ),
            ListTile(
              title: Text('Scan QR'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRScannerPage()),
                );
              },
            ),
            ListTile(
              title: Text('Connect with Travelers'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SummaryPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder<List>(
        future: _placesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No places found."));
          } else {
            final places = snapshot.data!;
            return ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                final place = places[index];
                final name = place['name'] ?? 'Unknown';
                final address =
                    place['location']['formatted_address'] ?? 'No address';

                return ListTile(
                  leading: const Icon(Icons.place),
                  title: Text(name),
                  subtitle: Text(address),
                );
              },
            );
          }
        },
      ),
    );
  }
}

/*
class ExploreGemsPage extends StatelessWidget {
  const ExploreGemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore Gems'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: Text('Leaderboard'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LeaderboardPage()),
                );
              },
            ),
            ListTile(
              title: Text('Scan QR'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRScannerPage()),
                );
              },
            ),
            ListTile(
              title: Text('Connect with Travelers'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SummaryPage()),
                );
              },
            ),
          ],
        ),
      ),
       body: ListView.builder(
        itemCount: List .length,
        itemBuilder: (context, index) {
          final place = places[index];
          return ListTile(
            title: Text(place['name']),
            subtitle: Text(place['location']['address'] ?? 'No address available'),
  
          );
        },
      ),
  
    );
  }
}
*/
//leaderboard page draft
class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Leaderboard'),
      ),
    );
  }
}

//qr scanner page
class QRScannerPage extends StatefulWidget {
  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  String _scannedQRCode = "Not scanned yet";

  Future<void> scanQRCode() async {
    try {
      String scannedQRCode = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", // The color of the cancel button
          "Cancel", // The text of the cancel button
          true, // Whether to show the flash option
          ScanMode.QR); // Set scan mode to QR_CODE

      if (!mounted) return;

      setState(() {
        _scannedQRCode =
            scannedQRCode != "-1" ? scannedQRCode : "Scan canceled";
      });
    } catch (e) {
      setState(() {
        _scannedQRCode = "Failed to scan: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("QR Scanner")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Scanned QR Code:",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              _scannedQRCode,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: scanQRCode,
              child: Text("Scan QR Code"),
            ),
          ],
        ),
      ),
    );
  }
}
