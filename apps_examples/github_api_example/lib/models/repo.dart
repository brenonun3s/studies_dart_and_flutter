class Repo {
  final String name;
  final String description;
  final int stars;
  final String language;

  Repo({
    required this.name,
    required this.description,
    required this.stars,
    required this.language,
  });

  factory Repo.fromJson(Map<String, dynamic> json) {
    return Repo(
      name: json['name'],
      description: json['description'] ?? 'Sem descrição',
      stars: json['stargazers_count'],
      language: json['language'] ?? 'N/A',
    );
  }
}
