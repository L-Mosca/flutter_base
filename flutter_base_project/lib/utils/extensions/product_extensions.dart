import 'package:intl/intl.dart';

extension ProductPriceExtensions on double? {
  Future<String> formatCurrency() async {
    final String systemLocale = Intl.getCurrentLocale();
    final format = NumberFormat.currency(locale: systemLocale);
    return format.format(this);
  }
}