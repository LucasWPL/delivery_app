import 'package:delivery_app/exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App de Delivery',
      theme: ThemeData(
        scaffoldBackgroundColor: BrandColors.generalBackgroundColor,
        fontFamily: 'LemonMilk',
      ),
      initialBinding: GeneralBinding(),
      home: const HomePage(),
    );
  }
}
