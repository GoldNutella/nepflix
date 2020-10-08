import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.black,
          brightness: Brightness.dark
      ),
      home: HomeView(),
    );
  }
}
class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final TextStyle topMenuStyle = new TextStyle(fontFamily: 'Avenir next', fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600);
  final TextStyle buttonInfoStyle = new TextStyle(fontFamily: 'Avenir next', fontSize: 10, color: Colors.white, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          child: Center(
            child: ListView(
              children: <Widget>[
                Container(
                  height: 430,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new AssetImage("lib/assets/coverpic.jpg"),
                        fit: BoxFit.fill
                    ),
                  ),
                 /* child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FlatButton(
                              child: Text('Series', style: topMenuStyle,),
                            ),
                            FlatButton(
                              child: Text('Films', style: topMenuStyle,),
                            ),
                            FlatButton(
                              child: Text('My List', style: topMenuStyle,),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ), */
                ),
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton(
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.info, color: Colors.white, size: 30,),
                            Text('Info', style: buttonInfoStyle,)
                          ],
                        ),
                        onPressed: () {

                        },
                      ),
                      FlatButton(
                        color: Colors.white,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.share, color: Colors.black,
                            ),
                            Text("Share", style: TextStyle(color: Colors.black),)
                          ],
                        ),
                        onPressed: () {

                        },
                      ),
                      FlatButton(
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.add, color: Colors.white, size: 30),
                            Text('My List', style: buttonInfoStyle,)
                          ],
                        ),
                        onPressed: () {

                        },
                      ),
                    ],
                  ),
                ),
                makePopularWidget("Recommended"),
                makePopularWidget("Trending"),
                makeContinueWatching("Currently Watching"),
                bannerMovie(),
                makeNetflixOrig('Netflix Originals'),
                makePopularWidget("Thriller"),
                makePopularWidget("New Releases"),
                makePopularWidget("Crime"),
                makePopularWidget("Comedy"),
                makePopularWidget("Romance"),
              ],
            ),
          )
      ),
    );
  }

  Widget bannerMovie() {
    return new Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text('Available Now', style: topMenuStyle,),
          ),
          Container(child: Image(
            image: new AssetImage("lib/assets/mh3banner.jpg"),
          ),),
          Container(
            padding: EdgeInsets.only(top: 4, bottom: 4),
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  child: Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    width: 140,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.share, color: Colors.black,),
                        Text('Share', style: TextStyle(color: Colors.black),)
                      ],
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () {},
                ),
                FlatButton(
                  child: Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    width: 140,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.add, color: Colors.white,),
                        Text('My List', style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                  color: Color(0xff4f4f4f),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget makeNetflixOrig(String title) {
    return new Container(
      padding: EdgeInsets.only(top: 30, left: 10),
      height: 400,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: topMenuStyle),
                ]
            ),
          ),
          Container(
            height: 350,
            child: ListView(
                padding: EdgeInsets.only(right: 6),
                scrollDirection: Axis.horizontal,
                //shrinkWrap: true,
                children: makeOriginals()
            ),
          )
        ],
      ),
    );
  }

  int counter = 0;
  List<Widget> makeOriginals() {
    List<Container> movieList = [];
    for (int i = 0; i < 6; i++) {
      counter++;
      movieList.add(new Container(
        margin: EdgeInsets.only(right: 10, top: 10),
        width: 200,

        decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage("lib/assets/" + counter.toString() + ".jpg"),
              fit: BoxFit.fitHeight
          ),
        ),
      ));
      if (counter == 12) {
        counter = 0;
      }
    }
    return movieList;
  }

  Widget makePopularWidget(String title) {
    return new Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      height: 220,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: topMenuStyle),
                ]
            ),
          ),
          Container(
            height: 200,
            child: ListView(
                padding: EdgeInsets.all(3),
                scrollDirection: Axis.horizontal,
                //shrinkWrap: true,
                children: makeContainers()
            ),
          )
        ],
      ),
    );
  }

  Widget makeContinueWatching(String title) {
    return new Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      height: 220,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: topMenuStyle),
                ]
            ),
          ),
          Container(
            height: 200,
            child: ListView(
                padding: EdgeInsets.all(3),
                scrollDirection: Axis.horizontal,
                //shrinkWrap: true,
                children: makeContinueContainers()
            ),
          )
        ],
      ),
    );
  }
  List<Widget> makeContainers() {
    List<Container> movieList = [];
    for (int i = 0; i < 6; i++) {
      counter++;
      movieList.add(new Container(
        padding: EdgeInsets.all(5),
        height: 200,

        child: Image(
          image: AssetImage("lib/assets/" + counter.toString() + ".jpg"),
        ),
      ));
      if (counter == 12) {
        counter = 0;
      }
    }
    return movieList;
  }

  List<Widget> makeContinueContainers() {
    List<Container> movieList = [];
    for (int i = 0; i < 6; i++) {
      counter++;
      movieList.add(new Container(
          padding: EdgeInsets.all(2),
          height: 200,

          child: Column(
            children: <Widget>[
              Container(
                height: 140,
                width: 100,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage("lib/assets/" + counter.toString() + ".jpg"),
                      fit: BoxFit.fitHeight
                  ),
                ),
              ),
              Container(
                height: 30,
                margin: EdgeInsets.all(3),
                padding: EdgeInsets.only(left: 10, right: 10),
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right:25),
                      child: Text('S1:E' + i.toString(), style: TextStyle(color: Color(0xffc1c1c1)),),
                    ),
                    Icon(Icons.info, size: 15,color: Color(0xffc1c1c1))
                  ],
                ),
              )
            ],
          )
      ));
      if (counter == 12) {
        counter = 0;
      }
    }
    return movieList;
  }
}
