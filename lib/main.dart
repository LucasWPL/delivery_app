import 'package:delivery_app/exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App de Delivery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'LemonMilk',
      ),
      home: const HomePage(),
    );
  }
}
