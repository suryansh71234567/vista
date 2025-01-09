import 'package:flutter/material.dart';
/*
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
*/

class TravelDetailsPage extends StatelessWidget {
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController transportationController =
      TextEditingController();
  final TextEditingController durationController = TextEditingController();

  final double _cardBorderRadius = 16.0;
  final double _headerHeight = 116.0;
  final double _contentPadding = 32.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.05),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGradientHeader(
              title: 'Travel Details',
              subtitle: 'Let\'s plan your journey',
            ),
            _buildMainContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientHeader({
    required String title,
    String? subtitle,
  }) {
    return Container(
      width: double.infinity,
      height: _headerHeight,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4B39EF), Color(0xFF39D2C0)],
          stops: [0, 1],
          begin: AlignmentDirectional(0, -1),
          end: AlignmentDirectional(0, 1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (subtitle != null)
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(_cardBorderRadius * 2),
          topRight: Radius.circular(_cardBorderRadius * 2),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(_contentPadding),
        child: Column(
          children: [
            _buildInputField(
              controller: budgetController,
              label: 'Budget',
              icon: Icons.attach_money,
            ),
            const SizedBox(height: 24),
            _buildInputField(
              controller: transportationController,
              label: 'Mode of Transportation',
              icon: Icons.directions_bus,
            ),
            const SizedBox(height: 24),
            _buildInputField(
              controller: durationController,
              label: 'Duration of Stay',
              icon: Icons.calendar_today,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 32),
            _buildNextButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
  }) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(_cardBorderRadius),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(_cardBorderRadius),
        ),
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: Icon(icon),
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _navigateToNextPage(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4B39EF),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        'Next',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _navigateToNextPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RoutesSuggestionsPage()),
    );
  }
}

class RoutesSuggestionsPage extends StatelessWidget {
  const RoutesSuggestionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.05),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildGradientHeader(),
            _buildNextButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientHeader() {
    return Container(
      width: double.infinity,
      height: 116,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF4B39EF), Color(0xFF39D2C0)],
          stops: [0, 1],
          begin: AlignmentDirectional(0, -1),
          end: AlignmentDirectional(0, 1),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Routes Suggestions',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: ElevatedButton(
        onPressed: () => _navigateToSelectPlan(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4B39EF),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Next',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _navigateToSelectPlan(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SelectPlanPage()),
    );
  }
}

class SelectPlanPage extends StatelessWidget {
  const SelectPlanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.05),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildGradientHeader(),
            _buildPlansList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientHeader() {
    return Container(
      width: double.infinity,
      height: 116,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF4B39EF), Color(0xFF39D2C0)],
          stops: [0, 1],
          begin: AlignmentDirectional(0, -1),
          end: AlignmentDirectional(0, 1),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a Plan',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlansList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          _buildPlanCard(context, 'Plan 1'),
          const SizedBox(height: 16),
          _buildPlanCard(context, 'Plan 2'),
          const SizedBox(height: 16),
          _buildPlanCard(context, 'Plan 3'),
        ],
      ),
    );
  }

  Widget _buildPlanCard(BuildContext context, String title) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: () => _navigateToSummary(context),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToSummary(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SummaryPage()),
    );
  }
}

class SummaryPage extends StatelessWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.05),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildGradientHeader(),
            _buildSummaryContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientHeader() {
    return Container(
      width: double.infinity,
      height: 116,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF4B39EF), Color(0xFF39D2C0)],
          stops: [0, 1],
          begin: AlignmentDirectional(0, -1),
          end: AlignmentDirectional(0, 1),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Summary',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryContent() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              const Text(
                'Connect with Travelers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Slider(
                value: 0,
                onChanged: (value) {
                  // Placeholder for slider functionality
                },
                min: 0,
                max: 100,
                activeColor: const Color(0xFF4B39EF),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
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
*/
