class ConstructionProject {
  const ConstructionProject({
    required this.id,
    required this.name,
    required this.location,
    required this.memberIds,
    required this.budget,
    required this.createdAt,
  });

  final String id;
  final String name;
  final String location;
  final List<String> memberIds;
  final double budget;
  final DateTime createdAt;

  factory ConstructionProject.fromMap(String id, Map<String, Object?> map) {
    return ConstructionProject(
      id: id,
      name: map['name'] as String? ?? '',
      location: map['location'] as String? ?? '',
      memberIds: List<String>.from(map['memberIds'] as List? ?? const []),
      budget: (map['budget'] as num?)?.toDouble() ?? 0,
      createdAt:
          DateTime.tryParse(map['createdAt'] as String? ?? '') ??
          DateTime(1970),
    );
  }

  Map<String, Object?> toMap() {
    return {
      'name': name,
      'location': location,
      'memberIds': memberIds,
      'budget': budget,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
