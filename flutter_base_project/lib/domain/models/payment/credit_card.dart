class CreditCard {
  int id;
  String number;
  String date;
  String securityNumber;

  CreditCard({
    required this.id,
    required this.number,
    required this.date,
    required this.securityNumber,
  });

  @override
  String toString() {
    return 'CreditCard{id: $id, number: $number, date: $date, securityNumber: $securityNumber}';
  }

  CreditCard.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        number = json['number'],
        date = json['date'],
        securityNumber = json['securityNumber'];

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["id"] = id;
    data["number"] = number;
    data["date"] = date;
    data["securityNumber"] = securityNumber;
    return data;
  }
}
