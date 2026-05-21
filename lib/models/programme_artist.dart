class ProgrammeArtist {
  // propriétés
  String? id,
      artistId,
      artistName,
      artistSlug,
      artistPoster,
      stage,
      stageSlug,
      day,
      timeStart,
      timeEnd;

  // constructeur
  ProgrammeArtist({
    required this.id,
    required this.artistId,
    required this.artistName,
    required this.artistSlug,
    required this.artistPoster,
    required this.stage,
    required this.stageSlug,
    required this.day,
    required this.timeStart,
    required this.timeEnd,
  });

  // méthodes
  factory ProgrammeArtist.fromJSON(dynamic json) {
    return ProgrammeArtist(
      id: json['id'],
      artistId: json['artistId'],
      artistName: json['artistName'],
      artistSlug: json['artistSlug'],
      artistPoster: json['artistPoster'],
      stage: json['stage'],
      stageSlug: json['stageSlug'],
      day: json['day'],
      timeStart: json['timeStart'],
      timeEnd: json['timeEnd'],
    );
  }
}
