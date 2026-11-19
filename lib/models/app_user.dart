enum UserRole {
  admin,
  worker;

  static UserRole fromValue(String? value) {
    return UserRole.values.firstWhere(
      (role) => role.name == value,
      orElse: () => UserRole.worker,
    );
  }
}

class AppUser {
  const AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.projectIds = const [],
  });

  final String id;
  final String name;
  final String email;
  final UserRole role;
  final List<String> projectIds;

  bool get isAdmin => role == UserRole.admin;

  factory AppUser.fromMap(String id, Map<String, Object?> map) {
    return AppUser(
      id: id,
      name: map['name'] as String? ?? '',
      email: map['email'] as String? ?? '',
      role: UserRole.fromValue(map['role'] as String?),
      projectIds: List<String>.from(map['projectIds'] as List? ?? const []),
    );
  }

  Map<String, Object?> toMap() {
    return {
      'name': name,
      'email': email,
      'role': role.name,
      'projectIds': projectIds,
    };
  }
}
