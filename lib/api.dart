import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> fetchNearbyPlaces(double latitude, double longitude) async {
  const String apiKey =
      "fsq3QnhCN+jSaFFD/4arWCtMaoVsFC3m6KBI/K4Fsj/LTHg="; // Replace with your actual API key
  final Uri url = Uri.parse(
      "https://api.foursquare.com/v3/places/nearby?ll=$latitude,$longitude");

  final response = await http.get(
    url,
    headers: {"Authorization": apiKey},
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data['results']; // List of nearby places
  } else {
    throw Exception("Failed to fetch places: ${response.statusCode}");
  }
}
