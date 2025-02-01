import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:study_hub/Binding/connectivity_binding.dart';
import 'package:study_hub/Route/route.dart';
import 'package:study_hub/firebase_options.dart';
import 'package:study_hub/utils/sharedPreference/localDatabase.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    kLogger.w("Starting Firebase initialization");
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    kLogger.e('Firebase initialization error: $e');
  }

  await UserSimplePreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 840),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, child) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Study Hub',
              theme: ThemeData(
                brightness: Brightness.light,
                primaryColor: Colors.red, // Example primary color
                hintColor: Colors.orange, // Example accent color
                scaffoldBackgroundColor: Colors.white,
                textTheme: TextTheme(
                  displayLarge: TextStyle(color: Colors.black, fontSize: 24.sp),
                  bodyLarge: TextStyle(color: Colors.black87, fontSize: 16.sp),
                ),
                buttonTheme: ButtonThemeData(
                  buttonColor: Colors.red, // Example button color
                  textTheme: ButtonTextTheme.primary,
                ),
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                primaryColor: Colors.red, // Same primary color in dark mode
                hintColor: Colors.orange, // Same accent color in dark mode
                scaffoldBackgroundColor: Colors.black,
                textTheme: TextTheme(
                  displayLarge: TextStyle(color: Colors.white, fontSize: 24.sp),
                  bodyLarge: TextStyle(color: Colors.white70, fontSize: 16.sp),
                ),
                buttonTheme: const ButtonThemeData(
                  buttonColor: Colors.red, // Same button color in dark mode
                  textTheme: ButtonTextTheme.primary,
                ),
              ),
              themeMode: ThemeMode.system,
              initialBinding: ConnectivityBinding(),
              getPages: AppRoutes.appRoutes(),
            ));
  }
}

class MainController extends GetxController {
  RxString fcmToken = "".obs;
}
