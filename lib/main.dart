import 'package:flutter/material.dart';
import 'package:search_list_api_working/views/EtudiantScreen.dart';




import 'models/Classe.dart';
import 'models/Etudiants.dart';
import 'views/etudiantscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion Etudiants',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MenuScreen(),
    );
  }
}

final Classe classes = Classe(libelle: 'L3GLRS', niveau: 'L3', filiere: 'GLRS');

class MenuScreen extends StatelessWidget {
  final List<Etudiants> etudiants = [
    Etudiants(
      nom: 'Mactar Thiam',
      tuteur: 'Ousmane Diop',
      email: 'mactarthiam@gmail.com',
      password: 'passer',
      classe: classes,
    ),
    Etudiants(
      nom: 'Sasoum Sane',
      tuteur: 'Abdou Sane',
      email: 'sasoumsane@gmail.com',
      password: 'passer',
      classe: classes,
    ),
    Etudiants(
      nom: 'libass Niang',
      tuteur: 'Moubarack Niang',
      email: 'libassniang102@gmail.com',
      password: 'passer',
      classe: classes,
    ),
    Etudiants(
      nom: 'Abdou Sylla',
      tuteur: 'serigne Ndiaye',
      email: 'abdousylla@gmail.com',
      password: 'passer',
      classe: classes,
    ),
    Etudiants(
      nom: 'adja Taiba ba',
      tuteur: 'salimata diouf',
      email: 'adjaba@gmail.com',
      password: 'passer',
      classe: classes,
    ),
  ];

  MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text('Gestion Etudiant'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchBarDelegate(),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Spacer(),
          Container(
            width: double.infinity,
            child: TextButton.icon(
              style: TextButton.styleFrom(
                minimumSize: const Size(
                    double.infinity, 50), // Ajuster la taille du bouton ici
              ),
              icon: const Icon(Icons.school),
              label: const Text('Etudiants'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EtudiantScreen(etudiants: etudiants),
                  ),
                  );
                },
              ),
            ),
          
        ],
      ),
    );
  }
}

class SearchBarDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Afficher les résultats de la recherche
    return Text('Résultats de la recherche pour : $query');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Afficher les suggestions lors de la saisie de recherche
    return Text('Suggestions de recherche pour : $query');
  }
}


