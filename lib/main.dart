import 'package:buddy_app/api/firebase_api.dart';
import 'package:buddy_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'app.dart';

// background message handler
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // [WORKING: triggered when app running in background and notification sent]
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print("BACKGOUND MESSAGE: ${message.messageId}");
}

void main() async {
  // HIVE ===========

  await Hive.initFlutter();

  var box = await Hive.openBox("myBox");

  // END: HIVE

  WidgetsFlutterBinding.ensureInitialized(); // step1 from tutorial
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler); // not in tutorial
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform); // step2 from tutorial
  await FirebaseApi()
      .initNotifications(); // step3 after making initNotifications() in firebase_api.dart

  runApp(const MyApp());
}
