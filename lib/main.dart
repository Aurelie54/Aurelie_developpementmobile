import 'package:flutter/material.dart';

void main() {
  runApp(const MuseumApp());
}

class MuseumApp extends StatelessWidget {
  const MuseumApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Museum',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const ArtWork(title: 'Museum'),
    );
  }
}

class ArtWork extends StatefulWidget {
  const ArtWork({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ArtWork> createState() => _MyArtworkState();
}

class _MyArtworkState extends State<ArtWork> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Center(
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
                const Text(
                  'Léonard De Vinci',
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Opacity(
              opacity: 0.75,
              child: Icon(
                Icons.favorite,
                color: Colors.white,
                size: 100,
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                IconButton(
                  icon: const Icon(Icons.article),
                  onPressed: () {
                    // Action à effectuer lors du clic sur l'icône article
                  },
                ),
                IconButton(
                  icon: Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}