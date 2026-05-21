import 'package:pauseguitare/models/artist_programme.dart';

class Artist {
  // propriétés
  String? id, name, slug, poster, video;
  List? musicTypes, description, countries, artistProgramme;

  // constructeur
  Artist({
    required this.id,
    required this.name,
    required this.slug,
    required this.poster,
    required this.video,
    required this.musicTypes,
    required this.description,
    required this.countries,
    required this.artistProgramme,
  });

  // méthodes
  factory Artist.fromJSON(dynamic json) {
    return Artist(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      poster: json['poster'],
      video: json['video'],
      musicTypes: json['musicTypes'],
      description: json['description'],
      countries: json['countries'],
      artistProgramme: (json['artistProgramme'] as List)
          .map((e) => ArtistProgramme.fromJSON(e))
          .toList(),
    );
  }
}
