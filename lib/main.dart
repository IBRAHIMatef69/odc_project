import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc_project/routes/routes.dart';
import 'package:odc_project/view/screens/splash_and_onBoarding/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ODC',
      theme: ThemeData(

        primarySwatch: Colors.orange,
      ),
      getPages: Routes.routes,
      initialRoute: Routes.splashScreen,
//home:  SplashScreen(),
    );
  }
} //
