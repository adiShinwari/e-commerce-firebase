import 'package:e_commerce_app/presentation/splash/splash_screen.dart';
import 'package:get/route_manager.dart';

import 'consts/consts.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        fontFamily: regular,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: darkFontGrey),
          color: Colors.transparent,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
