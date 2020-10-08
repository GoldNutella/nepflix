import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black, brightness: Brightness.dark),
      home: SearchView(),
    );
  }
}

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  Future<List<Movie>> _getMovies() async {
    var data = await http.get(
        "https://raw.githubusercontent.com/GoldNutella/nepflix/master/lib/assets/movielistjson.json");

    var jsonData = json.decode(data.body);

    List<Movie> movielist = [];

    for (var u in jsonData) {
      Movie movie = Movie(u["id"], u["title"], u["year"], u["runtime"],
          u["genres"], u["director"], u["actors"], u["plot"], u["posterUrl"]);

      movielist.add(movie);
    }

    print(movielist.length);

    return movielist;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Movie list'),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getMovies(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Loading...")));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int id) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(snapshot.data[id].posterUrl),
                    ),
                    title: Text(snapshot.data[id].name),
                    subtitle: Text(snapshot.data[id].email),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class Movie {
  final int id;
  final String title;
  final String year;
  final String runtime;
  final List<String> genres;
  final String director;
  final String actors;
  final String plot;
  final String posterUrl;

  Movie(this.id, this.title, this.year, this.runtime, this.genres,
      this.director, this.actors, this.plot, this.posterUrl);
}
