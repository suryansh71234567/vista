import 'package:flutter/material.dart';
import 'travel_details.dart';

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
                // Navigate to an empty Scan QR page
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
      body: Center(
        child: Text('Explore Gems'),
      ),
    );
  }
}

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
