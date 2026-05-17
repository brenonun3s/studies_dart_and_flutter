import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/repo.dart';

class GitHubService {
  final String _baseUrl = 'https://api.github.com';

  Future<List<Repo>> searchRepos(String query) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/search/repositories?q=$query'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> items = data['items'];
      return items.map((item) => Repo.fromJson(item)).toList();
    } else {
      throw Exception('Falha ao carregar repositórios');
    }
  }
}
