import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ReceiverAcceptRejectPage extends StatefulWidget {
  const ReceiverAcceptRejectPage({super.key});

  @override
  State<ReceiverAcceptRejectPage> createState() =>
      _ReceiverAcceptRejectPageState();
}

class _ReceiverAcceptRejectPageState extends State<ReceiverAcceptRejectPage> {
  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;

    return Scaffold(
      appBar: AppBar(
        title: Text("Accept Buddy Request?"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "About Requester",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("First Name: ${message.data['name']}"),
                  Text("Last Name: ${message.data['surname']}"),
                  Text("Gender: ${message.data["gender"]}"),
                  Text("Buddy Score: ${message.data["buddyScore"]}"),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                      "The user is available to go between ${message.data["startTime"]} and ${message.data["endTime"]}"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Accept the request
                      acceptRequest();
                    },
                    child: Text("Accept"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Reject the request
                      rejectRequest();
                    },
                    child: const Text("Reject"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> acceptRequest() async {
    // Accept the request
    showPopUp(context, height: 200, widgets: [
      const Text("You have accepted the request"),
      SizedBox(
        height: 10,
      ),
      const Text("You will receive a notification when the requester accepts"),
      SizedBox(
        height: 20,
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed('app');
        },
        child: const Text("Continue"),
      )
    ]);
  }

  Future<void> rejectRequest() async {
    // Reject the request

    Navigator.of(context).pushNamed('app');
  }

  // ====================================
  void showPopUp(BuildContext context,
      {required double height, required List<Widget> widgets}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Container(
                  height: height,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [...widgets],
                    ),
                  )),
            ));
  }
}
