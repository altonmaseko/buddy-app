import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // get the notification message and display it
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;

    return Scaffold(
      appBar: AppBar(
        title: Text("Nofification Testing Page"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Title: ${message.notification!.title.toString()}"),
            Text("Body: ${message.notification!.body.toString()}"),
            Text("Data: ${message.data.toString()}"),
          ],
        ),
      ),
    );
  }
}
