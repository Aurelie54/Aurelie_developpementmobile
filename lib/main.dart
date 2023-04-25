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
  bool _showDescription = false;
  

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
                Image.asset('assets/Mona_Lisa.jpg',
                width: 400,
                height: 400,
                ),
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
                Visibility(
                  visible: _showDescription,
                  child: Container(
                    width: 300,
                    height: 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const SingleChildScrollView(
                    child: Padding(
                    padding: EdgeInsets.all(10.0),
                  child: Text(
                    'La Joconde, ou Portrait de Mona Lisa, est un tableau de l\'artiste Léonard de Vinci, réalisé entre 1503 et 1506 ou entre 1513 et 15161,2, et peut-être jusqu\'à 1517 (l\'artiste étant mort le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à l\'huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à Paris. La Joconde est l\'un des rares tableaux attribués de façon certaine à Léonard de Vinci. La Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre d\'artistes l\'ont pris comme référence. À l\'époque romantique, les artistes ont été fascinés par ce tableau et ont contribué à développer le mythe qui l\'entoure, en faisant de ce tableau l’une des œuvres d\'art les plus célèbres du monde, si ce n\'est la plus célèbre : elle est en tout cas considérée comme l\'une des représentations d\'un visage féminin les plus célèbres au monde. Au xxie siècle, elle est devenue l\'objet d\'art le plus visité au monde, devant le diamant Hope, avec 20 000 visiteurs qui viennent l\'admirer et la photographier quotidiennement.',
                    style: TextStyle(
                      fontFamily: 'Merriweather',
                      fontSize: 15,
                      color: Colors.brown,
                    ),
                  ),
                      ),
                      ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Opacity(
              opacity: _isFavorite ? 1.0 : 0.75,
              child: Icon(
                Icons.favorite,
                color: _isFavorite ? Colors.red : Colors.white,
                size: 100,
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                IconButton(
                  icon: const Icon(Icons.article),
                  onPressed: () {
                      setState(() {
                      _showDescription = !_showDescription;
                    });
                    // Action à effectuer lors du clic sur l'icône article
                  },
                ),
                IconButton(
                  icon: Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.brown,
                  
                  ),
                  onPressed: () {
                    setState(() {
                      _isFavorite = !_isFavorite;

                      if (_isFavorite) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Oeuvre ajoutée à vos favoris')),
                          );
                           }
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