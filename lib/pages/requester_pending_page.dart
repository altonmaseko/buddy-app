import 'package:flutter/material.dart';

class RequesterPendingPage extends StatefulWidget {
  RequesterPendingPage({super.key});

  @override
  State<RequesterPendingPage> createState() => _RequesterPendingPageState();
}

class _RequesterPendingPageState extends State<RequesterPendingPage> {
  List<Widget> accepting_receivers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Requester Pending Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
                child: Text("Waiting for others to accept the request"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  accepting_receivers.add(getPerson(
                      name: "Alton", sex: "Male", email: "alton@gmail.com"));
                  setState(() {});
                },
                child: Text("Add Person"),
              ),
              // Contains the receivers that accepted the request
              Column(
                children: [...accepting_receivers],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getPerson(
      {required String name, required String email, required String sex}) {
    return Container(
      color: Colors.grey,
      margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [Text("Name: $name"), Text("Sex: $sex")],
          ),
          SizedBox(
            width: 20,
          ),
          IconButton(
            iconSize: 40,
            onPressed: () {
              // display pop up
              showPopUp(context, height: 200, widgets: [
                Text("$name Details",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text("Name: $name"),
                Text("Sex: $sex"),
                Text("Email: $email"),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // accept the receivers acceptance
                        Navigator.of(context).pop();
                      },
                      child: Text("Accept"),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // ignore the receivers acceptance
                        Navigator.of(context).pop();
                      },
                      child: Text("Ignore"),
                    )
                  ],
                )
              ]);
            },
            icon: Icon(Icons.check),
          )
        ],
      ),
    );
  }

  Future<void> requestBuddy() async {}

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
