import 'package:flutter/material.dart';
import 'travel_details.dart';

final TextEditingController _startingLocationController =
    TextEditingController();
final TextEditingController _finalDestinationController =
    TextEditingController();

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Travel Planner'),
      centerTitle: true,
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _startingLocationController,
            decoration: InputDecoration(
              labelText: 'Starting Location',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _finalDestinationController,
            decoration: InputDecoration(
              labelText: 'Final Destination',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Currently non-functional
            },
            child: Text('Suggest Destination'),
          ),
        ],
      ),
    ),
  );
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Planner'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _startingLocationController,
              decoration: InputDecoration(
                labelText: 'Starting Location',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _finalDestinationController,
              decoration: InputDecoration(
                labelText: 'Final Destination',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Currently non-functional
              },
              child: Text('Suggest Destination'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RoutesSuggestionsPage()),
                );
              },
              child: Text('next page'),
            ),
          ],
        ),
      ),
    );
  }
}
