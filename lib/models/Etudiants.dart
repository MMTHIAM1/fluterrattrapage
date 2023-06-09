
import 'Classe.dart';

class Etudiants {

  final String nom;
  final String tuteur;
  final String email;
  final String password;
  final Classe classe;

  Etudiants({required this.nom, required this.tuteur, required this.email,
      required this.password, required this.classe});
}