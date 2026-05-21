import 'package:pauseguitare/models/programme_artist.dart';

class Programme {
  // propriétés
  String? day;
  List? programmeArtists;

  // constructeur
  Programme({required this.day, required this.programmeArtists});

  // méthodes
  factory Programme.fromJSON(dynamic json) {
    return Programme(
      day: json['day'],
      programmeArtists: (json['programmeArtists'] as List)
          .map((e) => ProgrammeArtist.fromJSON(e))
          .toList(),
    );
  }
}
