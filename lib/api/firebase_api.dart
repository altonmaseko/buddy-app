import 'package:buddy_app/app.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

final secureStorage = FlutterSecureStorage();

final _myBox = Hive.box('myBox');

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  // initialize notifications
  Future<void> initNotifications() async {
    // request permission from the user
    await _firebaseMessaging.requestPermission();

    // fetch the FCM token for this device
    final FCMToken = await _firebaseMessaging.getToken();

    debugPrint("FCM_TOKEN: ${FCMToken}");

    // Store FCM TOKEN in storage
    _myBox.put("fcm", FCMToken);

    // initialize further things for push notifications
    initPushNotifications();
  }

  // handle messages
  void handleMessage(RemoteMessage? message) {
    if (message == null) {
      return;
    }

    debugPrint('NOTIFICATION RECEIVED: ${message.notification!.title}');

    navigatorKey.currentState?.pushNamed('mapspage', arguments: message);
  }

  // handle background settings
  Future initPushNotifications() async {
    // handle notification that opened app from a terminated (not running in background) state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      // [WORKING, WITH ui change due to _firebaseMessagingBackgroundHandler in main.dart]
      debugPrint(
          'NOTIFICATION [App opened and was not running]: ${message!.notification!.body}');

      WidgetsBinding.instance.addPostFrameCallback((_) {
        //delay launching receiver page
        navigatorKey.currentState
            ?.pushNamed('receiver_accept_reject_page', arguments: message);
      });
    });

    // event listener for when notification opens the app while was running in the background
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      // [WORKING]
      debugPrint(
          'NOTIFICATION [App opened from background]: ${message.notification!.body}');

      WidgetsBinding.instance.addPostFrameCallback((_) {
        //delay launching receiver page
        navigatorKey.currentState
            ?.pushNamed('receiver_accept_reject_page', arguments: message);
      });
    });

    // // event listener for when app is currently being displayed
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   // [WORKING]
    //   debugPrint(
    //       'NOTIFICATION [App in FOREGROUND]: ${message.notification!.body}');

    //   navigatorKey.currentState
    //       ?.pushNamed('mapspage', arguments: message); // [working]
    // });

    // Background message
  }

  // =========================
}
