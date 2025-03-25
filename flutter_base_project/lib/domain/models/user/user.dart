class User {
  int id;
  String name;
  String phone;
  String email;
  String password;
  String username;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.username,
  });

  @override
  String toString() {
    return 'User{id: $id, name: $name, phone: $phone, email: $email, password: $password, username: $username}';
  }

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        phone = json["phone"],
        email = json["email"],
        password = json["password"],
        username = json["username"];

  Map<String, dynamic> toJson() {
    final data = <String, dynamic> {};
    data["id"] = id;
    data["name"] = name;
    data["phone"] = phone;
    data["email"] = email;
    data["password"] = password;
    data["username"] = username;
    return data;
  }
}
