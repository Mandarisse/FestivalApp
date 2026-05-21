import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pauseguitare/models/programme_artist.dart';
import 'package:pauseguitare/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgrammeItem extends StatefulWidget {
  final ProgrammeArtist programmeArtist;

  const ProgrammeItem({super.key, required this.programmeArtist});

  @override
  State<ProgrammeItem> createState() => _ProgrammeItemState();
}

class _ProgrammeItemState extends State<ProgrammeItem> {
  // états
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((prefs) {
      List<String>? favorites = prefs.getStringList('favorites');

      if (favorites!.contains(widget.programmeArtist.id)) {
        setState(() {
          _isFavorite = true;
        });
      }
    });
  }

  // gérer les favoris
  void _handleFavorites() async {
    // accéder aux préférences de l'application
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // récupérer la liste des favoris
    List<String>? favorites = prefs.getStringList('favorites');

    if (!favorites!.contains(widget.programmeArtist.id)) {
      favorites.add(widget.programmeArtist.id!);
    } else {
      int index = favorites.indexWhere((id) => widget.programmeArtist.id == id);
      favorites.removeAt(index);
    }

    await prefs.setStringList('favorites', favorites);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Row(
        spacing: 5,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              'http://10.0.2.2:3000/images/artists/${widget.programmeArtist.artistPoster}',
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 20 - 20 - 60 - 10 - 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(widget.programmeArtist.artistName!),
                Text(
                  '${widget.programmeArtist.day} - ${widget.programmeArtist.timeStart}',
                ),
                Text(widget.programmeArtist.stage!),
              ],
            ),
          ),
          IconButton.filled(
            onPressed: () {
              // inspect(widget.programmeArtist);

              // gérer les favoris
              _handleFavorites();

              // setState : modification d'un état
              setState(() {
                _isFavorite = !_isFavorite;
              });
            },
            icon: _isFavorite
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_outline),
            color: Colors.white,
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                _isFavorite ? AppColors.primary : AppColors.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
