// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pauseguitare/models/artist.dart';
import 'package:pauseguitare/services/artists_api.dart';
import 'package:pauseguitare/widgets/home/artists_list_item.dart';

class ArtistsList extends StatelessWidget {
  const ArtistsList({super.key});

  @override
  Widget build(BuildContext context) {
    /*
      utilisation obligatoire du widget FutureBuilder pour accéder aux données d'une future
    */
    return FutureBuilder(
      future: ArtistsApi().getAll(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Artist> data = snapshot.requireData;
          // inspect(data);
          return Container(
            height: 240,
            padding: EdgeInsets.only(bottom: 40),
            child: ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              // boucle
              itemBuilder: (context, index) {
                return ArtistsListItem(artist: data[index]);
              },
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
