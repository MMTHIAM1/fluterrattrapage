import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Etudiants.dart';

class EtudiantScreen extends StatelessWidget {
  final List<Etudiants> etudiants;

  const EtudiantScreen({super.key, required this.etudiants}) {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listes Etudiants'),
      ),
      body: ListView.builder(
        itemCount: etudiants.length,
        itemBuilder: (context, index) {
          Etudiants etudiant = etudiants[index];
          return ListTile(
            title: Text('Nom : ${etudiant.nom}'),
            subtitle: Text('email: ${etudiant.email}, classe:${etudiant.classe.libelle}'),
          );
        },
      ),
    );
  }
}