import 'package:buddy_app/app.dart';
import 'package:buddy_app/constants/private_constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RequestBuddyPage extends StatefulWidget {
  RequestBuddyPage({super.key});

  @override
  State<RequestBuddyPage> createState() => _RequestBuddyPageState();
}

class _RequestBuddyPageState extends State<RequestBuddyPage> {
// Controllers
  final TextEditingController _destinationController = TextEditingController();

  final TextEditingController _startOfTimeRangeController =
      TextEditingController();

  final TextEditingController _endOfTimeRangeController =
      TextEditingController();

  final TextEditingController _numberOfPeopleTravellingController =
      TextEditingController();

  final TextEditingController _emailController = TextEditingController();

// ===========================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Buddy Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Destination
              TextFormField(
                controller: _destinationController,
                decoration: const InputDecoration(
                  labelText: "Destination",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Start Time To Go
              TextFormField(
                controller: _startOfTimeRangeController,
                decoration: const InputDecoration(
                  labelText: "Start Time To Go",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // End Time To Go
              TextFormField(
                controller: _endOfTimeRangeController,
                decoration: const InputDecoration(
                  labelText: "End Time To Go",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Number of People Travelling
              TextFormField(
                controller: _numberOfPeopleTravellingController,
                decoration: const InputDecoration(
                  labelText: "Number of People Travelling",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Email
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('requester_pending_page');
                    requestBuddy();
                  },
                  child: const Text("Request Buddy"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> requestBuddy() async {
    String url = baseUrl + "/api/notifications/requestbuddy";
    final uri = Uri.parse(url);

    final getUserResponse =
        await http.get(Uri.parse("/getuser/${_emailController.text}"));

    print(getUserResponse);

    return;

    var body = {
      "latitude": "-26.191303127347776",
      "longitude": "28.03205699491756",
      "email": "alton@example.com",
      "destination": "Wits Education Campus",
      "startTime": "18:00",
      "endTime": "20:00"
    };

    try {
      final response = await http.post(uri, body: body);

      if (response.statusCode == 200) {
        navigatorKey.currentState?.pushNamed('requester_pending_page');
      } else {
        showPopUp(context,
            height: 200, widgets: [Text("No nearby users found")]);
      }
    } catch (e) {
      showPopUp(context, height: 200, widgets: [Text("No nearby users found")]);
    }
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
