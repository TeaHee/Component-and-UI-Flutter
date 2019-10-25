import 'package:auto_slide_image/car.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

var currentCar = carList.cars[0];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SlideImage(),
    );
  }
}

class SlideImage extends StatefulWidget {
  @override
  _SlideImageState createState() => _SlideImageState();
}

class _SlideImageState extends State<SlideImage> {
  static final List<String> imgList = currentCar.imgList;

  final List<Widget> child = _map<Widget>(imgList, (index, String assetName) {
    return Container(
        child: Image.asset("assets/$assetName", fit: BoxFit.fitWidth));
  }).toList();

  static List<T> _map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Slide Image'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            CarouselSlider(
              height: 250,
              viewportFraction: 1.0,
              items: child,
              autoPlay: true,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Container(
                margin: EdgeInsets.only(left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: _map<Widget>(imgList, (index, assetName) {
                    return Container(
                      width: 50,
                      height: 2,
                      decoration: BoxDecoration(
                          color: _current == index
                              ? Colors.grey[100]
                              : Colors.grey[600]),
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
