import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  final String imagePath;
  final String labelText;

  const CarouselItem({
    Key? key,
    required this.imagePath,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade800,
            offset: const Offset(-4.0, 2.0),
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage(imagePath),
              width: 150,
              height: 150, // Adjust height as needed
            ),
          ),
          const SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              labelText + "\ntrips",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge, // Adjust text style
            ),
          ),
        ],
      ),
    );
  }
}
