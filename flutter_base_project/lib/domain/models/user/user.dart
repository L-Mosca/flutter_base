class User {
  int id;
  String name;
  String phone;
  String email;
  String password;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });

  @override
  String toString() {
    return 'User{id: $id, name: $name, phone: $phone, email: $email, password: $password}';
  }

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        phone = json["phone"],
        email = json["email"],
        password = json["password"];

  Map<String, dynamic> toJson() {
    final data = <String, dynamic> {};
    data["id"] = id;
    data["name"] = name;
    data["phone"] = phone;
    data["email"] = email;
    data["password"] = password;
    return data;
  }
}
