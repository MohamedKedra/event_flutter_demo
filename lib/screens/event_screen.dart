import 'package:eventflutterdemo/screens/simple_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCustomScroll(),
    );
  }

  _buildCustomScroll() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: CustomScrollView(
        slivers: [
          _buildAppbar(),
          SliverList(
            delegate: SliverChildListDelegate(_buildList(4)),
          )
        ],
      ),
    );
  }

  List _buildList(int count) {
    List<Widget> listItems = List();
    for (int i = 0; i < count; i++) {
      switch (i) {
        case 0:
          {
            listItems.add(
              Container(
                child: _buildEventDetails(),
              ),
            );
          }
          break;

        case 1:
          {
            listItems.add(
              Container(
                child: _buildTrainerInfo(),
              ),
            );
          }
          break;

        case 2:
          {
            listItems.add(
              Container(
                child: _buildAboutLayout(),
              ),
            );
          }
          break;

        case 3:
          {
            listItems.add(
              Container(
                child: _buildPriceTypes(),
              ),
            );
          }
          break;
      }
    }

    return listItems;
  }

  _buildAppbar() => SliverAppBar(
        actions: [
          IconButton(icon: Icon(Icons.share), onPressed: () => {}),
          IconButton(icon: Icon(Icons.star_border), onPressed: () => {}),
        ],
        expandedHeight: 300.0,
        floating: true,
        pinned: true,
        snap: true,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            child: ImageSliderWidget(
              imageUrls: _imageUrls,
              imageBorderRadius: BorderRadius.circular(0.0),
            ),
          ),
        ),
      );

  _buildEventDetails() => Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 16,
            ),
            Text("# Music"),
            Text(
              "Event Celebration Party",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            _buildLayout(Icon(Icons.calendar_today), "Tue, 15Jul,2018"),
            _buildLayout(Icon(Icons.not_listed_location), "Germany"),
            Divider()
          ],
        ),
      );

  _buildTrainerInfo() => Container(

    margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8),
                  child: Image.network(
                    _imageUrls[3],
                    height: 50,
                    width: 50,
                  ),
                ),
                _buildHeaderSectionTitle("Ahmed Ali")
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
                child: Text(
                    "About trainerAbout trainerAbout trainerAbout trainerAbout trainerAbout trainerAbout trainerAbout trainerAbout trainer")),
            Divider()
          ],
        ),
      );

  _buildAboutLayout() => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: _buildHeaderSectionTitle("About Event"),
                    ),
                    Text(
                        "About trainerAbout trainerAbout trainerAbout trainerAbout trainerAbout trainerAbout trainerAbout trainerAbout trainer"),
                  ],
                )),
            Divider()
          ],
        ),
      );

  _buildPriceTypes() => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: _buildHeaderSectionTitle("Price Type"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Price 1"), Text("200 EGP")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Price 2"), Text("300 EGP")],
                    ),
                  ],
                )),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () => {},
                child: Text("data"),
              ),
            )
          ],
        ),
      );

  _buildLayout(Widget leading, String title) => ListTile(
        leading: leading,
        title: Text(title),
      );

  _buildHeaderSectionTitle(String title) => Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      );

  final _imageUrls = [
    "http://skillzycp.com/upload/business/389_636896432064799384.jpg",
    "http://skillzycp.com/upload/business/389_636896432315268827.jpg",
    "http://skillzycp.com/upload/business/389_636896432445581923.jpg",
    "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350"
  ];
}
