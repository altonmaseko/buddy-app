import 'package:buddy_app/components/ListBox.dart';
import 'package:buddy_app/constants/colors.dart';
import 'package:buddy_app/constants/image_strings.dart';
import 'package:buddy_app/constants/sizes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import '../components/CarouselItem.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: myBody(),
    );
  }

  Widget myBody() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CarouselSlider(
                items: [
                  CarouselItem(
                    imagePath: TImages.goldB,
                    labelText: "100",
                  ),
                  CarouselItem(
                    imagePath: TImages.silverB,
                    labelText: "50",
                  ),
                  CarouselItem(
                    imagePath: TImages.brozeB,
                    labelText: "10",
                  ),
                ],
                options: CarouselOptions(
                  height: constraints.maxHeight * 0.3,
                  enlargeCenterPage: true,
                ),
              ),
              SizedBox(height: TSizes.spaceBtwInputFields),
              Expanded(child: _showTasks()), // Wrap _showTasks in Expanded
            ],
          ),
        );
      },
    );
  }

  Widget _showTasks() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (_, index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          child: SlideAnimation(
            child: FadeInAnimation(
              // Wrap Row in Expanded or Flexible to handle horizontal constraints
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        print("tapped");
                      },
                      child: ListBox(
                        "Kayisha Naidoo",
                        "Rennie House",
                        "9am",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
