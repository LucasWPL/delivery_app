import 'package:intl/intl.dart';

extension CurrencyFormatting on double {
  String toCurrency({String locale = 'pt_BR'}) {
    final NumberFormat currencyFormat =
        NumberFormat.simpleCurrency(locale: locale);
    return currencyFormat.format(this);
  }
}
