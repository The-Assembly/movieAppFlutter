import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(new MyApp());

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
            child: new Text("Hello world"),
          ),
        ),
      ); 
    }
}