import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../constants/sizes.dart';

class buddyRequestForm extends StatefulWidget {
  const buddyRequestForm({super.key});

  @override
  State<buddyRequestForm> createState() => _buddyRequestFormState();
}

class _buddyRequestFormState extends State<buddyRequestForm> {
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _destinationController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request a Buddy',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
               ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    SizedBox(height: TSizes.spaceBtwInputFields,),
                    /// Destination Input -------------------------------------------
                    TextFormField(
                      controller: _destinationController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.location),
                        labelText: "Destination:",
                      ),
                    ),

                    SizedBox(height: TSizes.spaceBtwInputFields,),

                    /// Time Input ---------------------------------------------------
                    TextFormField(
                      controller: _timeController,
                      readOnly: true, // To make the field non-editable
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.clock),
                        labelText: "Time",
                      ),
                      onTap: () => _pickTime(context), // Show the Time Picker
                    ),

                    const SizedBox(height: 10),

                    /// Confirm Button ----------------------------------------------
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Destination is:${_destinationController.text}\nTime set for${_timeController.text}")));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          '✓ Confirm',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Time Picker Function -----------------------------------------------------
  Future<void> _pickTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        // Format the time and set it to the _timeController
        _timeController.text = pickedTime.format(context);
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Time selection cancelled")));
    }
  }
}
