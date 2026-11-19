enum ApartmentStatus {
  planned,
  inProgress,
  completed;

  static ApartmentStatus fromValue(String? value) {
    return ApartmentStatus.values.firstWhere(
      (status) => status.name == value,
      orElse: () => ApartmentStatus.planned,
    );
  }
}

class Apartment {
  const Apartment({
    required this.id,
    required this.projectId,
    required this.code,
    required this.block,
    required this.floor,
    required this.status,
    required this.budget,
    this.ownerName,
  });

  final String id;
  final String projectId;
  final String code;
  final String block;
  final int floor;
  final ApartmentStatus status;
  final double budget;
  final String? ownerName;

  factory Apartment.fromMap(String id, Map<String, Object?> map) {
    return Apartment(
      id: id,
      projectId: map['projectId'] as String? ?? '',
      code: map['code'] as String? ?? '',
      block: map['block'] as String? ?? '',
      floor: (map['floor'] as num?)?.toInt() ?? 0,
      status: ApartmentStatus.fromValue(map['status'] as String?),
      budget: (map['budget'] as num?)?.toDouble() ?? 0,
      ownerName: map['ownerName'] as String?,
    );
  }

  Map<String, Object?> toMap() {
    return {
      'projectId': projectId,
      'code': code,
      'block': block,
      'floor': floor,
      'status': status.name,
      'budget': budget,
      'ownerName': ownerName,
    };
  }
}
