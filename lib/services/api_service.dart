import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article_model.dart';

class ApiService {
  final String apiUrl = "https://api.spaceflightnewsapi.net/v4/articles/";

  Future<List<Article>> fetchArticles() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Decode the JSON response into a Map
      Map<String, dynamic> jsonResponse = json.decode(response.body);

      // Extract the 'results' field which contains the list of articles
      List<dynamic> articlesJson = jsonResponse['results'];

      // Map each item in the list to an Article object
      return articlesJson.map((article) => Article.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
