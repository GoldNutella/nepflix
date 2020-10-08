import 'package:flutter/material.dart';
import 'package:nepflix/entities/movie.dart';
import 'package:nepflix/searchpage.dart';


class MovieDetailPage extends StatelessWidget {

  final Movie movie;

  MovieDetailPage(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(movie.title),
        )
    );
  }
}

