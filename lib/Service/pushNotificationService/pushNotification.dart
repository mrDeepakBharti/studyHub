import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:study_hub/Route/RouteName.dart';
import 'package:study_hub/utils/sharedPreference/localDatabase.dart';

class NotificationServices {
  // /// Constructor
  // NotificationServices() {
  //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //   FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);
  //   // Handle the case when the app is in the foreground
  //   FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
  // }

  bool _notificationOpened = false;

  /// initialising firebase message plugin
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  /// initialising firebase message plugin
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// function to initialise flutter local notification plugin to show notifications for android when app is active
  void initLocalNotifications(
      BuildContext context, RemoteMessage message) async {
    var androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);

    /// request notification permissions for android 13 or above
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();

    await _flutterLocalNotificationsPlugin.initialize(initializationSetting,
        onDidReceiveBackgroundNotificationResponse: (payload) {
      handleMessage(context, message);
    }, onDidReceiveNotificationResponse: (payload) {
      /// handle interaction when app is active for android
      handleMessage(context, message);
    });
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;

      if (kDebugMode) {
        print("notifications title:${notification!.title}");
        print("notifications body:${notification.body}");
        print('count:${android!.count}');
        print('data:${message.data.toString()}');
      }

      if (Platform.isIOS) {
        forgroundMessage();
      }

      if (Platform.isAndroid) {
        initLocalNotifications(context, message);
        showNotification(message);
      }
    });
  }

  void requestNotificationPermission() async {
    if (Platform.isIOS) {
      await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true,
      );
    }
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      String? apns = await messaging.getAPNSToken();
      kLogger.w("apns:: $apns");
      if (kDebugMode) {
        kLogger.i('user granted notification permission');
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        kLogger.w('user granted provisional notification permission');
      }
    } else {
      //appsetting.AppSettings.openNotificationSettings();
      if (kDebugMode) {
        kLogger.e('user denied notification permission');
      }
    }
  }

  /// function to show visible notification when app is active
  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      message.notification!.android!.channelId.toString(),
      message.notification!.android!.channelId.toString(),
      description: message.notification!.body.toString(),
      importance: Importance.max,
      showBadge: true,
      playSound: true,
      // sound: const RawResourceAndroidNotificationSound('jetsons_doorbell')
    );

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            // 'pinqin',
            // 'pushnotificationappchannel',
            channel.id.toString(),
            channel.name.toString(),
            channelDescription: channel.description.toString(),
            importance: Importance.high,
            priority: Priority.high,
            playSound: true,
            ticker: 'ticker',
            sound: channel.sound,
            icon: "@drawable/app_icon"
            //     sound: RawResourceAndroidNotificationSound('jetsons_doorbell')
            //   icon: largeIconPath
            );

    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
            presentAlert: true, presentBadge: true, presentSound: true);

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title.toString(),
        message.notification!.body.toString(),
        notificationDetails,
      );
    });
  }

  Future<String?> getDeviceToken({int maxRetires = 3}) async {
    try {
      String? token = await messaging.getToken();
      return token!;
    } catch (e) {
      kLogger.e("failed to get device token");
      if (maxRetires > 0) {
        kLogger.w("try after 3 sec");
        await Future.delayed(const Duration(seconds: 3));
        return getDeviceToken(maxRetires: maxRetires - 1);
      } else {
        return null;
      }
    }
  }

  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      if (kDebugMode) {
        print('refresh');
      }
    });
  }

  /// handle tap on notification when app is in background or terminated
  Future<void> setupInteractMessage(BuildContext context) async {
    ///  when app is terminated
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _notificationOpened = true;
      await Get.toNamed(RouteName.bottomNav);
      handleMessage(context, initialMessage);
    }

    /// when app ins background
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      handleMessage(context, message);
    });
  }

  void handleMessage(BuildContext context, RemoteMessage message) async {
    kLogger.w("${message.data}");

    switch (message.data['click_action']) {
      case 'pinqin_chat':
        kLogger.f('Handling chat Notification');
        _notificationOpened = true;
        // MyApp.navigatorKey.currentState?.pushNamed(RouteName.chatListScreen);
        // Get.offAllNamed(RouteName.chatListScreen);
        //Get.toNamed(RouteName.chatListScreen);
        break;
      case 'pinqin_share_story':
        kLogger.f('Handling story share Notification');
        _notificationOpened = true;
        // MyApp.navigatorKey.currentState
        //     ?.pushNamed(RouteName.storyConsentsScreen);
        // Get.offAllNamed(RouteName.storyConsentsScreen);
        //Get.toNamed(RouteName.storyConsentsScreen);
        break;
      case 'pinqin_meeting':
        kLogger.f('Handling story share Notification');
        _notificationOpened = true;
        // MyApp.navigatorKey.currentState
        //     ?.pushNamed(RouteName.meetingHistoryScreen);
        // Get.offAllNamed(RouteName.meetingHistoryScreen);
        //Get.toNamed(RouteName.storyConsentsScreen);
        break;

      default:
        break;
    }
  }

  Future forgroundMessage() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}
