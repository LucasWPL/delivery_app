import 'package:delivery_app/exports.dart';
import 'package:delivery_app/tokens/neutral_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyA-GuF6F7hXxQ_isReWUNTNScrAbPOfx2Y",
      authDomain: "delivery-app-71305.firebaseapp.com",
      projectId: "delivery-app-71305",
      storageBucket: "delivery-app-71305.firebasestorage.app",
      messagingSenderId: "630933507092",
      appId: "1:630933507092:web:ef26c5c5fb93688b476b01",
      measurementId: "G-CZHFLYRY62",
    ),
  );
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
        primaryColor: BrandColors.primaryColor,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: BrandColors.primaryColor,
          refreshBackgroundColor: NeutralColors.offWhite,
        ),
        fontFamily: 'LemonMilk',
      ),
      initialBinding: GeneralBinding(),
      home: const MenuPage(),
      getPages: Routes.dependencies,
    );
  }
}
