import 'package:flutter/widgets.dart';

class ScreenHelper {
  final BuildContext context;

  const ScreenHelper(this.context);

  double widthPercentage(double percentage) {
    return (MediaQuery.of(context).size.width / 100) * percentage;
  }

  double heightPercentage(double percentage) {
    return (MediaQuery.of(context).size.height / 100) * percentage;
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= 600;
  }
}
