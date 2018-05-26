import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(new MyApp());

class Movie {
  String poster;
  String title;
  String overview;
  String releaseDate;

  Movie({this.poster,this.title,this.overview,this.releaseDate});

  getTitle(){
    return this.title;
  }

  getPoster(){
    return this.poster;
  }

  getOverview(){
    return this.overview;
  }

  getReleaseDate(){
    return this.releaseDate;
  }
}

class MyApp extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new MaterialApp(
        home: new TopMovies(),
      );
    }
}

class TopMovies extends StatefulWidget {
  @override
  createState() => new TopMoviesState();
}

class TopMoviesState extends State<TopMovies> {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new MaterialApp(
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text("What's Hot"),
          ),
          body: new Center(
            child: _fetchMovies(),
          ),
        ),
      ); 
    }

    List<Movie> _movies = new List();
    
    final _apiGateWayUrl = "https://c46ojze5r8.execute-api.us-east-1.amazonaws.com/Testing";

}