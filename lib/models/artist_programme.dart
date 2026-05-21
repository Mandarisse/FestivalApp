class ArtistProgramme {
  // propriétés
  String? stage, stageSlug, day, timeStart, timeEnd;

  // constructeur
  ArtistProgramme({
    required this.stage,
    required this.stageSlug,
    required this.day,
    required this.timeStart,
    required this.timeEnd,
  });

  // méthodes
  factory ArtistProgramme.fromJSON(dynamic json) {
    return ArtistProgramme(
      stage: json['stage'],
      stageSlug: json['stageSlug'],
      day: json['day'],
      timeStart: json['timeStart'],
      timeEnd: json['timeEnd'],
    );
  }
}
