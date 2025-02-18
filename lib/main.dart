import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:study_hub/Binding/connectivity_binding.dart';
import 'package:study_hub/Route/route.dart';
import 'package:study_hub/Service/pushNotificationService/pushNotification.dart';
import 'package:study_hub/firebase_options.dart';
import 'package:study_hub/utils/sharedPreference/localDatabase.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // kLogger.i("handled background message");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Firebase and other necessary services outside runZonedGuarded
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    kLogger.i('Firebase initialized successfully.');

    // Initialize Firebase Crashlytics
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    kLogger.i('Firebase Crashlytics initialized successfully.');

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    NotificationServices notificationServices = NotificationServices();
    kLogger.i('NotificationServices initialized successfully.');

    if (Platform.isIOS) {
      final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
      kLogger.w("APNS Token: $apnsToken");
    }

    ///Initialize network listener
    // ConnectivityController connection = ConnectivityController();
    // connection.onInit();

    notificationServices.isTokenRefresh();
    final fcmToken = await notificationServices.getDeviceToken();
    kLogger.i("FCM Token: $fcmToken");

    MainController mainController = Get.put(MainController());
    mainController.fcmToken.value = fcmToken;
    subscribeToJobUpdatesTopic();

    await UserSimplePreferences.init();

    // Run the app
    runApp(const MyApp());
  } catch (e) {
    kLogger.e('Error during Firebase initialization: $e');
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.foregroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();
    notificationServices.getDeviceToken();
  }

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

void subscribeToJobUpdatesTopic() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Subscribe to the 'job_updates' topic
  await messaging.subscribeToTopic('job_posts');

  print('Subscribed to job_updates topic');
}
