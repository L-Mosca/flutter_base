class LoginBodyDto {
  String username;
  String password;

  LoginBodyDto({required this.username, required this.password});

  @override
  String toString() {
    return 'LoginBody{username: $username, password: $password}';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic> {};
    data["username"] = username;
    data["password"] = password;
    return data;
  }
}
