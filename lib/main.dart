import 'package:flutter/material.dart';

void main() {
  runApp(const MuseumApp());
}

class MuseumApp extends StatelessWidget {
  const MuseumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Museum',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ArtWork(title: 'Museum'),
    );
  }
}


class ArtWork extends StatefulWidget {
  const ArtWork({super.key, required this.title});

  final String title;

  @override
  State<ArtWork> createState() => _MyArtworkState();
}

class _MyArtworkState extends State<ArtWork> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:  Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/Mona_Lisa.jpg'),
            const Text(
              'Mona Lisa',
                style: TextStyle(
                  fontFamily: 'Merriweather',
                  fontSize: 30,
                  color: Colors.brown,
  ),
  
            ),
            const Text (
              'Léonard De Vinci',
                style: TextStyle(
                  fontFamily: 'Merriweather',
                  fontSize: 15,
                  fontWeight : FontWeight.bold,
                  color: Colors.brown,
  ),
  

            ),

          ],
        ),
      ),

    );
  }
}


