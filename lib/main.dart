import 'package:demo/core/localization/local_stoage_service.dart';
import 'package:demo/core/routes/routes.dart';
import 'package:demo/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize GetStorage
  await LocalStorageService.init();
  //

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: Routes.routes,
      theme: TappTheme.lightTheme,
      darkTheme: TappTheme.darkTheme,
    );
  }
}
