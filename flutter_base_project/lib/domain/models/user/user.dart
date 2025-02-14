class User {
  int id;
  String name;
  String phone;
  String email;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
  });

  @override
  String toString() {
    return 'User{id: $id, name: $name, phone: $phone, email: $email}';
  }
}
