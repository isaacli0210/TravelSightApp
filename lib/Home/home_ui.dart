import 'package:flutter/material.dart';
import 'package:travel_sight_app/global.dart';
import 'package:travel_sight_app/Home/place.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: ()=>{},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.black,),
            onPressed: () => {},
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 6, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 18),
              child: Text('Discover', style: heading)
            ),
            Container(
              //color: Color.fromARGB(50, 1, 1, 1),
              padding: EdgeInsets.only(left: 2, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  FlatButton(
                    child: Text('Places', style: tabTitle),
                    onPressed: ()=>{},
                  ),
                  FlatButton(
                    child: Text('Inspiration', style: tabTitle),
                    onPressed: ()=>{},
                  ),
                  FlatButton(
                    child: Text('Emotions', style: tabTitle),
                    onPressed: ()=>{},
                  ),
                  
                  
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints.expand(height:300),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: getPlacesList(),
              ),
            ),
            Container(
              //color: Color.fromARGB(50, 1, 1, 1),
              padding: EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Explore more', style: title),
                  InkWell(child: Text('See all', style: buttonSeeAll), onTap: ()=>{},)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(6),
              constraints: BoxConstraints.expand(height:120),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: getActivityList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> activityCategories = ['Kayaking', 'Snorkeling', 'Balloning', 'Hiking', 'Bicycling'];

  Map activityCatToIcon = {
    'Kayaking': Icon(Icons.local_shipping, color: Colors.orange,), 
    'Snorkeling': Icon(Icons.local_taxi, color: Colors.blueGrey[700],),
    'Balloning': Icon(Icons.cake, color: Colors.purple[600],),
    'Hiking': Icon(Icons.landscape, color: Colors.green[600],),
    'Bicycling': Icon(Icons.directions_bike, color: Colors.red[400],)
  };

    Map activityCatToColor = {
    'Kayaking': Colors.orange[200],
    'Snorkeling': Colors.blueGrey[200],
    'Balloning': Colors.purple[100],
    'Hiking': Colors.green[200],
    'Bicycling': Colors.red[100],
  };

  Widget activityCard(String activity) {
    return Container(
      //color: Colors.black,
      height: 120,
      width: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: activityCatToColor[activity],
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: activityCatToIcon[activity],
          ),
          Text(activity, style: activityTitle)
        ],
      ),
    );
  }

  List<Widget> getActivityList() {
    List<Widget> activityCards = [];
    List<String> activityCats = activityCategories;
    for (String activityCat in activityCats) {
      activityCards.add(activityCard(activityCat));
    }
    return activityCards;
  }

  List<Place> getPlaces() {
    List<Place> places = [];
    for(int i = 1; i < 6; i++) {
      places.add(Place('https://i.pravatar.cc/150?img=$i', 'Cascade', 'USA', 'California'));
    }
    return places;
  }

  List<Widget> getPlacesList() {
    List<Widget> placeCards = [];
    List<Place> places = getPlaces();
    for (Place place in places) {
      placeCards.add(placeCard(place));
    }
    return placeCards;
  }

  Widget placeCard(Place place) {
    return Container(
      height: 300,
      width: 180,
      margin: EdgeInsets.fromLTRB(18, 8, 0, 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        image: DecorationImage(
          image: NetworkImage(place.placeImageURL),
          fit: BoxFit.cover
        )
      ),
      child: Container(
        margin: EdgeInsets.fromLTRB(18, 0, 0, 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(place.placeName, style: placeName)
              ]
            ),
            SizedBox(height: 4),
            Row(
              children: <Widget>[
                Icon(Icons.location_on, size: 14, color: Colors.white),
                SizedBox(width: 4),
                Text('${place.placeCountry}, ${place.placeState}', style: placeCountryState),
              ],
            )
          ],
        ),
      ),
    );
  }
}