import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:buddy_app/constants/colors.dart';

class ListBox extends StatelessWidget {
  String Name;
  String Time;
  String Destination;

  ListBox(
    this.Name,
    this.Destination,
    this.Time,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 12),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2), // Shadow color
              spreadRadius: 1, // Spread of the shadow
              blurRadius: 1, // Blur radius of the shadow
              offset: Offset(1, 1), // Offset in x and y direction
            ),
          ],
          border: Border.all(
            color: TColors.AppBlue, // Set the color for the outline
            width: 2, // Set the width for the outline
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Title
                Text(
                  Destination,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 16),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      size: 18,
                    ),
                    SizedBox(width: 4),
                    Text(
                      Time,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  Name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                      ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            width: 0.5,
            color: CupertinoColors.inactiveGray,
          ),
          const RotatedBox(
            quarterTurns: 4,
            child: Icon(
              Iconsax.alarm,
            ),
          ),
        ]),
      ),
    );
  }
}
