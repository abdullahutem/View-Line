class Advertisement {
  final String id;
  final String title;
  final String description;
  final String imageUrl;

  const Advertisement({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  List<Object?> get props => [id, title, description, imageUrl];
}
