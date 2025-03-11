import 'package:flutter_base_project/domain/models/payment/credit_card.dart';

class Payment {
  CreditCard card;
  int times;
  double totalValue;

  Payment({
    required this.card,
    required this.times,
    required this.totalValue,
  });

  @override
  String toString() {
    return 'Payment{card: $card, times: $times, totalValue: $totalValue}';
  }

  Payment.fromJson(Map<String, dynamic> json)
      : card = json["card"],
        times = json["times"],
        totalValue = json["totalValue"];

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["card"] = card.toJson();
    data["times"] = times;
    data["totalValue"] = totalValue;
    return data;
  }
}
