import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
        body: myBody());
  }

  Widget myBody() {
    return Container(child: LayoutBuilder(builder: (context, constraints) {
      return Container(
        child: CarouselSlider(
            items: [],
            options: CarouselOptions(height: constraints.maxHeight * 0.6)),
      );
    }));
  }
}
