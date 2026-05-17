import 'package:flutter/material.dart';
import '../models/repo.dart';

class RepoList extends StatelessWidget {
  final List<Repo> repos;

  RepoList({required this.repos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: repos.length,
      itemBuilder: (context, index) {
        final repo = repos[index];
        return Card(
          child: ListTile(
            title: Text(repo.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(repo.description),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, size: 16),
                    SizedBox(width: 4),
                    Text('${repo.stars}'),
                    SizedBox(width: 16),
                    Icon(Icons.code, size: 16),
                    SizedBox(width: 4),
                    Text(repo.language),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
