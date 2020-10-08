import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:nepflix/entities/movie.dart';
import 'package:nepflix/moviedetailspage.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black, brightness: Brightness.dark,),
      home: SearchView(),
    );
  }
}

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  List<Movie> _movielist = List<Movie>();
  List<Movie> _movielistdisplayed = List<Movie>();

  Future<List<Movie>> fetchMovies() async {
    var url = 'https://raw.githubusercontent.com/hjorturlarsen/IMDB-top-100/master/data/movies.json';
    var response = await http.get(url);

    var notes = List<Movie>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(Movie.fromJson(noteJson));
      }
    }
    return notes;
  }

  @override
  void initState() {
    fetchMovies().then((value) {
      setState(() {
        _movielist.addAll(value);
        _movielistdisplayed = _movielist;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Movie list'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
           return index == 0 ? _searchBar() : _listItem(index-1);
          },
          itemCount: _movielistdisplayed.length+1,

        )
    );
  }

  _searchBar(){
    return Padding(padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search...'
        ),
        onChanged: (text){
          text = text.toLowerCase();
          setState(() {
            _movielistdisplayed = _movielist.where((movie) {
              var movieTitle = movie.title.toLowerCase();
              return movieTitle.contains((text));
            }).toList();
          });
        },
      ),
    );
  }
  _listItem(index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _movielistdisplayed[index].title,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}

