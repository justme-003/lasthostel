class UserRole {
  final int roleId;

  UserRole({required this.roleId});

  factory UserRole.fromJson(Map<String, dynamic> json) {
    return UserRole(
      roleId: json['roleId'],
    );
  }
}
