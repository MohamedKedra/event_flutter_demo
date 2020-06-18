import 'package:eventflutterdemo/screens/simple_slider.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              actions: [
                IconButton(icon: Icon(Icons.share), onPressed: () =>{}),
                IconButton(icon: Icon(Icons.star_border), onPressed: () =>{}),
              ],
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    child: ImageSliderWidget(
                      imageUrls: _imageUrls,
                      imageBorderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
              ),
            ),
          ];
        },
        body: Center(
          child: Text("Sample Text"),
        ),
      ),
    );
  }

  final _imageUrls = [
    "http://skillzycp.com/upload/business/389_636896432064799384.jpg",
    "http://skillzycp.com/upload/business/389_636896432315268827.jpg",
    "http://skillzycp.com/upload/business/389_636896432445581923.jpg",
    "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350"
  ];
}
