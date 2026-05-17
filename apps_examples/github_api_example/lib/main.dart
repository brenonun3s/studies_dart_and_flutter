import 'package:flutter/material.dart';
import 'models/repo.dart';
import 'services/github_service.dart';
import 'widgets/repo_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Repo Search',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GitHubService _githubService = GitHubService();
  List<Repo> _repos = [];
  bool _isLoading = false;
  String _errorMessage = '';

  void _searchRepos(String query) async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final repos = await _githubService.searchRepos(query);
      setState(() {
        _repos = repos;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Erro ao buscar repositórios';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GitHub Repo Search')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Buscar repositórios',
                suffixIcon: Icon(Icons.search),
              ),
              onSubmitted: _searchRepos,
            ),
            SizedBox(height: 20),
            if (_isLoading) CircularProgressIndicator(),
            if (_errorMessage.isNotEmpty)
              Text(_errorMessage, style: TextStyle(color: Colors.red)),
            if (_repos.isNotEmpty) Expanded(child: RepoList(repos: _repos)),
          ],
        ),
      ),
    );
  }
}
