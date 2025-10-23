class Service {
  final String id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String location;
  final String date;
  final double cost;
  final String description;
  final List<String> terms;
  final List<String> requirements;
  final List<String> tripPlan;

  const Service({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.location,
    required this.date,
    required this.cost,
    required this.description,
    required this.terms,
    required this.requirements,
    required this.tripPlan,
  });

  List<Object?> get props => [
    id,
    title,
    subtitle,
    imageUrl,
    location,
    date,
    cost,
    description,
    terms,
    requirements,
    tripPlan,
  ];
}
