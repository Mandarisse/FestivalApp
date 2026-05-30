import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:pauseguitare/models/programme.dart';
import 'package:pauseguitare/models/programme_artist.dart';
import 'package:pauseguitare/services/programme_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<String> _favoriteIds = [];
  List<ProgrammeArtist> _favorites = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    setState(() {
      _loading = true;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favorites = prefs.getStringList('favorites');

    _favoriteIds = favorites ?? [];

    // fetch all programmes
    try {
      List<Programme> programmes = await ProgrammeApi().getAll();

      // flatten programmeArtists and filter by favorite ids
      List<ProgrammeArtist> allArtists = [];
      for (var p in programmes) {
        if (p.programmeArtists != null) {
          allArtists.addAll(List<ProgrammeArtist>.from(p.programmeArtists!));
        }
      }

      _favorites = allArtists
          .where((a) => a.id != null && _favoriteIds.contains(a.id))
          .toList();
    } catch (e) {
      _favorites = [];
    }

    setState(() {
      _loading = false;
    });
  }

  Future<void> _removeFavorite(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favorites = prefs.getStringList('favorites');

    if (favorites == null) return;

    favorites.removeWhere((f) => f == id);
    await prefs.setStringList('favorites', favorites);

    // update local state
    setState(() {
      _favoriteIds = favorites;
      _favorites.removeWhere((a) => a.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mon espace'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.favorite), text: 'Favoris'),
              Tab(icon: Icon(Icons.notifications), text: 'Notifications'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Favoris
            _loading
                ? Center(child: CircularProgressIndicator())
                : _favorites.isEmpty
                ? Center(child: Text('Aucun favori pour le moment.'))
                : ListView.builder(
                    itemCount: _favorites.length,
                    itemBuilder: (context, index) {
                      final item = _favorites[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: item.artistPoster != null
                              ? NetworkImage(
                                  'http://10.0.2.2:3000/images/artists/${item.artistPoster}',
                                )
                              : null,
                        ),
                        title: Text(item.artistName ?? ''),
                        subtitle: Text(
                          '${item.day ?? ''} - ${item.timeStart ?? ''} → ${item.timeEnd ?? ''}',
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete_outline),
                          onPressed: () async {
                            if (item.id != null)
                              await _removeFavorite(item.id!);
                          },
                        ),
                      );
                    },
                  ),

            // Notifications
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Activez les notifications pour cette application dans les réglages de votre appareil, pour choisir les informations à recevoir.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => AppSettings.openAppSettings(),
                    child: Text('Accéder aux réglages'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
