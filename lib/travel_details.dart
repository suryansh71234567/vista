import 'package:flutter/material.dart';

class TravelDetailsPage extends StatelessWidget {
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController transportationController =
      TextEditingController();
  final TextEditingController durationController = TextEditingController();

  TravelDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: budgetController,
              decoration: InputDecoration(
                labelText: 'Budget',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: transportationController,
              decoration: InputDecoration(
                labelText: 'Mode of Transportation',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: durationController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Duration of Stay',
                border: OutlineInputBorder(),
              ),
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
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class RoutesSuggestionsPage extends StatelessWidget {
  const RoutesSuggestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routes Suggestions'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SelectPlanPage()),
            );
          },
          child: Text('Next'),
        ),
      ),
    );
  }
}

class SelectPlanPage extends StatelessWidget {
  const SelectPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Plan'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SummaryPage()),
              );
            },
            child: Container(
              height: 150,
              margin: EdgeInsets.all(16),
              color: Colors.grey[300],
              child: Center(child: Text('Plan 1')),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SummaryPage()),
              );
            },
            child: Container(
              height: 150,
              margin: EdgeInsets.all(16),
              color: Colors.grey[300],
              child: Center(child: Text('Plan 2')),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SummaryPage()),
              );
            },
            child: Container(
              height: 150,
              margin: EdgeInsets.all(16),
              color: Colors.grey[300],
              child: Center(child: Text('Plan 3')),
            ),
          ),
        ],
      ),
    );
  }
}

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Connect with Travelers',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: 0,
              onChanged: (value) {
                // Empty slider functionality
              },
              min: 0,
              max: 100,
            ),
          ],
        ),
      ),
    );
  }
}
