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

class Movie {
  String poster;
  String title;
  String overview;
  String releaseDate;

  Movie({this.poster, this.title, this.overview, this.releaseDate});

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

class TopMovies extends StatefulWidget {
  @override
  createState() => new TopMoviesState();
}

class TopMoviesState extends State<TopMovies> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'WatchNow',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("What's Hot"),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
          ],
        ),
        body: new Center(
          child:  _fetchMovies(),
        ),
      ),
    );
  }


  List<Movie> _movies = new List();

  List<Movie> _saved = new List();



  final _apiGatewayURL = "https://gfioehu47k.execute-api.us-west-1.amazonaws.com/staging/main";

  Widget _fetchMovies() {


    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _movies.length,
      itemBuilder: (context, i){
        final alreadySaved = _saved.contains(_movies[i]);
        return new Card(
            child: new Container(
                height: 250.0,
                child: new Padding(
                    padding: new EdgeInsets.all(2.0),
                    child: new Row(
                        children: <Widget>[
                          new Align(
                            child: new Hero(
                                child: new Image.network("https://image.tmdb.org/t/p/w500"+this._movies[i].getPoster()),
                                tag: this._movies[i].getTitle()
                            ),
                            alignment: Alignment.center,
                          ),
                          new Expanded(
                              child: new Stack(
                                  children: <Widget>[
                                    new Align(
                                      child: new Text(
                                        this._movies[i].getTitle(),
                                        style: new TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold),
                                      ),
                                      alignment: Alignment.topCenter,
                                    ),
                                    new Align(
                                      child: new Padding(
                                          padding: new EdgeInsets.all(4.0),
                                          child: new Text(
                                              this._movies[i].getOverview(),
                                              maxLines: 8,
                                              overflow: TextOverflow.ellipsis,
                                              style: new TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic)
                                          )
                                      ),
                                      alignment: Alignment.centerRight,
                                    ),
                                    new Align(
                                      child : new GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            if(alreadySaved){
                                              _saved.remove(_movies[i]);
                                            } else {
                                              _saved.add(_movies[i]);
                                            }
                                          });
                                        },
                                        child: new Icon(
                                          alreadySaved ? Icons.favorite : Icons.favorite_border,
                                          color: alreadySaved ? Colors.red : null,
                                        )
                                      ),
                                      alignment: Alignment.bottomRight,
                                    ),
                                  ]
                              )
                          )
                        ]
                    )
                )
            )
        );
      },
    );
  }

  void _addMovie(dynamic movie){
    this._movies.add(new Movie(
        title: movie["title"],
        overview: movie["overview"],
        poster: movie["poster_path"],
        releaseDate: movie["release_date"]
    ));
    setState(() { _movies = _movies; });
  }

  @override
  void initState() {
    super.initState();
    http.get(this._apiGatewayURL)
        .then((response) => response.body)
        .then(json.decode)
        .then((movies) {
      movies.forEach(_addMovie);
    });
  }

  void _pushSaved(){
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (context){

        return new Scaffold(
          appBar: new AppBar(
            title: new Text('Saved Suggestions'),
          ),
          body: new ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: _saved.length,
            itemBuilder: (context, i) {
              return new Card(
                  child: new Container(
                      height: 250.0,
                      child: new Padding(
                          padding: new EdgeInsets.all(2.0),
                          child: new Row(
                              children: <Widget>[
                                new Align(
                                  child: new Hero(
                                      child: new Image.network("https://image.tmdb.org/t/p/w500"+this._saved[i].getPoster()),
                                      tag: this._saved[i].getTitle()
                                  ),
                                  alignment: Alignment.center,
                                ),
                                new Expanded(
                                    child: new Stack(
                                        children: <Widget>[
                                          new Align(
                                            child: new Text(
                                              this._saved[i].getTitle(),
                                              style: new TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold),
                                            ),
                                            alignment: Alignment.topCenter,
                                          ),
                                          new Align(
                                            child: new Padding(
                                                padding: new EdgeInsets.all(4.0),
                                                child: new Text(
                                                    this._saved[i].getOverview(),
                                                    maxLines: 8,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: new TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic)
                                                )
                                            ),
                                            alignment: Alignment.centerRight,
                                          )
                                        ]
                                    )
                                )
                              ]
                          )
                      )
                  )
              );
            }
          )
        );
      })
    );
  }

}
