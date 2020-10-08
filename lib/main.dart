import 'package:flutter/material.dart';
import 'homepage.dart';
import 'searchpage.dart';

void main() => runApp(Nepflix());

class Nepflix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: NepflixTabBar(),
    );
  }
}
class NepflixTabBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Theme(
          data: ThemeData(
              brightness: Brightness.dark
          ),
          child: Scaffold(
            bottomNavigationBar: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.home,), text: "Home",),
                  Tab(icon: Icon(Icons.search), text: "Search"),
                  Tab(icon: Icon(Icons.list), text: "More"),
                ],
                unselectedLabelColor: Color(0xff999999),
                labelColor: Colors.white,
                indicatorColor: Colors.transparent
            ),
            body: TabBarView(
              children: [
                HomePage(),
                SearchPage(),
                Center( child: Text("Settings and more"),),
              ],
            ),
          ),
        )
    );
  }
}
