import 'package:flutter_base_project/domain/models/user/user.dart';

class UserDto {
  Address? address;
  int? id;
  String? email;
  String? userName;
  String? password;
  Name? name;
  String? phone;

  UserDto({
    this.address,
    this.id,
    this.email,
    this.userName,
    this.password,
    this.name,
    this.phone,
  });

  @override
  String toString() {
    return 'UserDto{address: $address, id: $id, email: $email, userName: $userName, password: $password, name: $name, phone: $phone}';
  }

  UserDto.fromJson(Map<String, dynamic> json) {
    address = Address.fromJson(json["address"]);
    id = json["id"];
    email = json["email"];
    userName = json["username"];
    password = json["password"];
    name = Name.fromJson(json["name"]);
    phone = json["phone"];
  }
}

class Address {
  Geolocation? geoLocation;
  String? city;
  String? street;
  int? number;
  String? zipCode;

  Address({
    this.geoLocation,
    this.city,
    this.street,
    this.number,
    this.zipCode,
  });

  @override
  String toString() {
    return 'Address{geoLocation: $geoLocation, city: $city, street: $street, number: $number, zipCode: $zipCode}';
  }

  Address.fromJson(Map<String, dynamic> json) {
    geoLocation = Geolocation.fromJson(json["geolocation"]);
    city = json["city"];
    street = json["street"];
    number = json["number"];
    zipCode = json["zipcode"];
  }
}

class Geolocation {
  String? lat;
  String? long;

  Geolocation({this.lat, this.long});

  @override
  String toString() {
    return 'Geolocation{lat: $lat, long: $long}';
  }

  Geolocation.fromJson(Map<String, dynamic> json) {
    lat = json["lat"];
    long = json["long"];
  }
}

class Name {
  String? firstName;
  String? lastName;

  Name({this.firstName, this.lastName});

  @override
  String toString() {
    return 'Name{firstName: $firstName, lastName: $lastName}';
  }

  Name.fromJson(Map<String, dynamic> json) {
    firstName = json["firstname"];
    lastName = json["lastname"];
  }
}

extension UserDtoExtension on UserDto? {
  User toUser() {
    return User(
      id: this?.id ?? 0,
      name: "${this?.name?.firstName} ${this?.name?.lastName}",
      phone: this?.phone ?? "",
      email: this?.email ?? "",
    );
  }
}
