import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:giphy_picker/giphy_picker.dart';
//Bored project

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pick a Gif',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GiphyGif? _gif;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Center(
          child: _gif == null
              ? Text('Pick a gif..')
              : GiphyImage.original(gif: _gif!),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.catching_pokemon),
        onPressed: () async {
          // request your Giphy API key at https://developers.giphy.com/
          final gif = await GiphyPicker.pickGif(
            context: context,
            apiKey: 'R6v0ndPACHQ6LtShfNrPO6HQMF0md8Pm',
            fullScreenDialog: false,
            previewType: GiphyPreviewType.previewWebp,
            decorator: GiphyDecorator(
              showAppBar: false,
              searchElevation: 4,
              giphyTheme: ThemeData.dark().copyWith(
                inputDecorationTheme: InputDecorationTheme(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          );

          if (gif != null) {
            setState(() => _gif = gif);
          }
        },
      ),
    );
  }
}