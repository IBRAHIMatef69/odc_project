import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:odc_project/routes/routes.dart';

void main()async {  WidgetsFlutterBinding.ensureInitialized();
await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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
