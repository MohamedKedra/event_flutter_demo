import 'package:eventflutterdemo/blocs/EventBloc.dart';
import 'package:eventflutterdemo/data/event_response.dart';
import 'package:eventflutterdemo/screens/simple_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  EventBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = EventBloc();
    bloc.refreshEvent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCustomScroll(),
    );
  }

  _buildCustomScroll() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: StreamBuilder<EventResponse>(
          initialData: null,
          stream: bloc.streamSubject.stream,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return CustomScrollView(
              slivers: [
                _buildAppbar(snapshot.data.img),
                SliverList(
                  delegate:
                  SliverChildListDelegate(_buildList(4, snapshot.data)),
                )
              ],
            );
          }else{
            return CircularProgressIndicator();
          }
        }
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Loading data from API..."), CircularProgressIndicator()],
        ));
  }

  List _buildList(int count, EventResponse eventResponse) {
    List<Widget> listItems = List();
    for (int i = 0; i < count; i++) {
      switch (i) {
        case 0:
          {
            listItems.add(
              Container(
                child: _buildEventDetails(eventResponse),
              ),
            );
          }
          break;

        case 1:
          {
            listItems.add(
              Container(
                child: _buildTrainerInfo(eventResponse),
              ),
            );
          }
          break;

        case 2:
          {
            listItems.add(
              Container(
                child: _buildAboutLayout(eventResponse),
              ),
            );
          }
          break;

        case 3:
          {
            listItems.add(
              Container(
                child: _buildPriceTypes(eventResponse),
              ),
            );
          }
          break;
      }
    }

    return listItems;
  }

  _buildAppbar(List<String> imageUrls) => SliverAppBar(
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
              imageUrls: imageUrls,
              imageBorderRadius: BorderRadius.circular(0.0),
            ),
          ),
        ),
      );

  _buildEventDetails(EventResponse eventResponse) => Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 16,
            ),
            Text("# ${eventResponse.interest}"),
            Text(
              eventResponse.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            _buildLayout(Icon(Icons.calendar_today), eventResponse.date),
            _buildLayout(
                Icon(Icons.not_listed_location), eventResponse.address),
            Divider()
          ],
        ),
      );

  _buildTrainerInfo(EventResponse eventResponse) => Container(
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
                    eventResponse.trainerImg,
                    height: 50,
                    width: 50,
                  ),
                ),
                _buildHeaderSectionTitle(eventResponse.trainerName)
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Text(eventResponse.trainerInfo),
            ),
            Divider()
          ],
        ),
      );

  _buildAboutLayout(EventResponse eventResponse) => Container(
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
                    Text(eventResponse.occasionDetail),
                  ],
                )),
            Divider()
          ],
        ),
      );

  _buildPriceTypes(EventResponse eventResponse) {
    var types = eventResponse.reservTypes;
    return Container(
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
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index)=>Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text(types[index].name), Text("${types[index].price.toString()} SAR")],
                    ),itemCount: types.length,)
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
  }

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

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }
}
