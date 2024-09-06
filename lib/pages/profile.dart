
import 'package:buddy_app/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


import '../constants/colors.dart';
import '../constants/sizes.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name = "Anna Khumalo";
    String email = "annabellek@gmail.com";

    return Scaffold(
      appBar: AppBar(
        title:
            Text('Profile', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: CircleAvatar(
                    backgroundColor: TColors.AppBlue,
                    backgroundImage: AssetImage(TImages.people)),
              ),
              //Name
              Text(
                '${name}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                '${email}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: TSizes.defaultSpace,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 20),
                ),
                label: Text("Sign Out"),
                icon: Icon(Iconsax.login),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Sign Out'),
                        content:
                            const Text('Are you sure you want to sign out?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                              // Add sign-out logic here
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(
                                  color: TColors.AppBlue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: const Text('No',
                                style: TextStyle(
                                    color: TColors.AppBlue,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
