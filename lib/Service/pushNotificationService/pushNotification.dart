import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:study_hub/utils/sharedPreference/localDatabase.dart';

// class NotificationServices {
//   /// initialising firebase message plugin
//   FirebaseMessaging messaging = FirebaseMessaging.instance;

//   /// initialising firebase message plugin
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   /// function to initialise flutter local notification plugin to show notifications for android when app is active
//   void initLocalNotifications(
//       BuildContext context, RemoteMessage message) async {
//     var androidInitializationSettings =
//         const AndroidInitializationSettings('@mipmap/ic_launcher');
//     var iosInitializationSettings = const DarwinInitializationSettings();

//     var initializationSetting = InitializationSettings(
//         android: androidInitializationSettings, iOS: iosInitializationSettings);

//     await _flutterLocalNotificationsPlugin.initialize(initializationSetting,
//         onDidReceiveNotificationResponse: (payload) {
//       /// handle interaction when app is active for android
//       handleMessage(context, message);
//     });
//   }

//   void firebaseInit(BuildContext context) {
//     FirebaseMessaging.onMessage.listen((message) {
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification!.android;

//       if (kDebugMode) {
//         print("notifications title:${notification!.title}");
//         print("notifications body:${notification.body}");
//         print('count:${android!.count}');
//         print('data:${message.data.toString()}');
//       }

//       if (Platform.isIOS) {
//         forgroundMessage();
//       }

//       if (Platform.isAndroid) {
//         initLocalNotifications(context, message);
//         showNotification(message);
//       }
//     });
//   }

//   void requestNotificationPermission() async {
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: true,
//       criticalAlert: true,
//       provisional: true,
//       sound: true,
//     );

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       if (kDebugMode) {
//         print('user granted permission');
//       }
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       if (kDebugMode) {
//         print('user granted provisional permission');
//       }
//     } else {
//       //appsetting.AppSettings.openNotificationSettings();
//       if (kDebugMode) {
//         print('user denied permission');
//       }
//     }
//   }

//   /// function to show visible notification when app is active
//   Future<void> showNotification(RemoteMessage message) async {
//     AndroidNotificationChannel channel = AndroidNotificationChannel(
//       message.notification!.android!.channelId.toString(),
//       message.notification!.android!.channelId.toString(),
//       description: message.notification!.body.toString(),
//       importance: Importance.max,
//       showBadge: true,
//       playSound: true,
//       // sound: const RawResourceAndroidNotificationSound('jetsons_doorbell')
//     );

//     AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails(
//             // 'pinqin',
//             // 'pushnotificationappchannel',
//             channel.id.toString(),
//             channel.name.toString(),
//             channelDescription: channel.description.toString(),
//             importance: Importance.high,
//             priority: Priority.high,
//             playSound: true,
//             ticker: 'ticker',
//             sound: channel.sound,
//             icon: "@drawable/app_icon"
//             //     sound: RawResourceAndroidNotificationSound('jetsons_doorbell')
//             //   icon: largeIconPath
//             );

//     const DarwinNotificationDetails darwinNotificationDetails =
//         DarwinNotificationDetails(
//             presentAlert: true, presentBadge: true, presentSound: true);

//     NotificationDetails notificationDetails = NotificationDetails(
//         android: androidNotificationDetails, iOS: darwinNotificationDetails);

//     Future.delayed(Duration.zero, () {
//       _flutterLocalNotificationsPlugin.show(
//         0,
//         message.notification!.title.toString(),
//         message.notification!.body.toString(),
//         notificationDetails,
//       );
//     });
//   }

//   /// function to get device token on which we will send the notifications
//   Future<String> getDeviceToken() async {
//     String? token = await messaging.getToken();
//     return token!;
//   }

//   void isTokenRefresh() async {
//     messaging.onTokenRefresh.listen((event) {
//       event.toString();
//       if (kDebugMode) {
//         print('refresh');
//       }
//     });
//   }

//   /// handle tap on notification when app is in background or terminated
//   Future<void> setupInteractMessage(BuildContext context) async {
//     ///  when app is terminated
//     RemoteMessage? initialMessage =
//         await FirebaseMessaging.instance.getInitialMessage();

//     if (initialMessage != null) {
//       handleMessage(context, initialMessage);
//     }

//     /// when app ins background
//     FirebaseMessaging.onMessageOpenedApp.listen((event) {
//       handleMessage(context, event);
//     });
//   }

//   void handleMessage(BuildContext context, RemoteMessage message) {
//     kLogger.w("${message.data}");

//     switch (message.data['click_action']) {
//       case 'pinqin_chat':
//         kLogger.f('Handling chat Notification');
//         Get.toNamed(RouteName.bottomNav);
//         break;
//       case 'pinqin_share_story':
//         kLogger.f('Handling share Notification');
//         Get.toNamed(RouteName.bottomNav);
//         break;
//       default:
//         break;
//     }
//   }

//   Future forgroundMessage() async {
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }
// }

class NotificationServices {
  /// Initializing Firebase Messaging plugin

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  /// Initializing Flutter Local Notifications plugin
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Function to initialize Flutter local notification plugin to show notifications for Android when app is active
  void initLocalNotifications(
      BuildContext context, RemoteMessage message) async {
    var androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (payload) {
        /// Handle interaction when app is active for Android
        handleMessage(context, message);
      },
    );
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = notification?.android;

      if (kDebugMode) {
        print("notifications title: ${notification?.title}");
        print("notifications body: ${notification?.body}");
        print('count: ${android?.count}');
        print('data: ${message.data.toString()}');
      }

      if (Platform.isIOS) {
        foregroundMessage();
      }

      if (Platform.isAndroid) {
        initLocalNotifications(context, message);
        showNotification(message);
      }
    });
  }

  void requestNotificationPermission() async {
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
      if (kDebugMode) {
        print('User granted permission');
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('User granted provisional permission');
      }
    } else {
      if (kDebugMode) {
        print('User denied permission');
      }
    }
  }

  /// Function to show visible notification when app is active
  Future<void> showNotification(RemoteMessage message) async {
    if (message.notification?.android == null) return;

    AndroidNotificationChannel channel = AndroidNotificationChannel(
      message.notification!.android!.channelId ?? 'default_channel',
      message.notification!.android!.channelId ?? 'Default Channel',
      importance: Importance.max,
      showBadge: true,
      playSound: true,
    );

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: 'Your channel description',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
      ticker: 'ticker',
      sound: channel.sound,
    );

    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    _flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? 'No Title',
      message.notification?.body ?? 'No Body',
      notificationDetails,
    );
  }

  /// Function to get device token on which we will send the notifications
  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token ?? '';
  }

  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      if (kDebugMode) {
        print('Token refreshed');
      }
    });
  }

  /// Handle tap on notification when app is in background or terminated
  Future<void> setupInteractMessage(BuildContext context) async {
    /// When app is terminated
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      handleMessage(context, initialMessage);
    }

    /// When app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
  }

  // void handleMessage(BuildContext context, RemoteMessage message) {
  //   kLogger.w("${message.data}");
  //
  //   switch (message.data['how are']) {
  //     case 'pinqin_chat':
  //       kLogger.f('Handling chat Notification');
  //       Get.toNamed(RouteName.job);
  //       break;
  //     case 'pinqin_share_story':
  //       kLogger.f('Handling share Notification');
  //       Get.toNamed(RouteName.userProfile);
  //       break;
  //     default:
  //       break;
  //   }
  // }
  void handleMessage(BuildContext context, RemoteMessage message) {
    // Log the notification data
    kLogger.w("${message.data}");

    // Extract required values from the notification data
    final String? notificationType = message.data['notification_type'];
    final String? chatType = message.data['chat_type'];
    final String? userId = message.data['user_id'];
    final String? myId = message.data['my_id'];

    // Handle different types of notifications
    // switch (notificationType) {
    //   case 'chat':
    //     if (chatType == 'group') {
    //       kLogger.f('Navigating to Group Chat with User ID: $userId');
    //       // Navigate to the group chat page and pass the user ID as a parameter
    //       Get.toNamed(RouteName.topics);
    //     } else if (chatType == 'one to one chat') {
    //       kLogger.f('Navigating to One-to-One Chat with User ID: $userId');

    //       // Access the chatListController to find the user
    //       homeController.currentIndex.value = 3;
    //       Get.toNamed(
    //         RouteName.bottomNav,
    //       );

    //       kLogger.f('Unknown chat type: $chatType');
    //     }

    // default:
    // kLogger.f('Unknown notification type: $notificationType');
  }

  Future foregroundMessage() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}

void subscribeToJobPostTopic(String fcmToken) async {
  await FirebaseMessaging.instance.subscribeToTopic('job_posts');
  kLogger.i('Subscribed to job_posts topic');
}
