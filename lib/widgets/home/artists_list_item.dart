// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pauseguitare/models/artist.dart';
import 'package:pauseguitare/widgets/shared/artist_bottom_sheet.dart';

class ArtistsListItem extends StatelessWidget {
  final Artist artist;

  const ArtistsListItem({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 130,
        color: Colors.white,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(right: 10),
        child: Column(
          spacing: 5,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    'http://10.0.2.2:3000/images/artists/${artist.poster}',
                  ),
                ),
              ),
            ),
            Text(
              artist.name!,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              spacing: 3,
              children: [
                Icon(Icons.label_outline),
                Expanded(
                  child: Text(
                    artist.musicTypes![0],
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
            Row(
              spacing: 3,
              children: [
                Icon(Icons.calendar_month_outlined),
                Expanded(
                  child: Text(
                    DateFormat(
                      'E d/MM',
                      'fr_FR',
                    ).format(DateTime.parse(artist.artistProgramme![0].day)),
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        // inspect(artist);
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return ArtistBottomSheet(artist: artist);
          },
        );
      },
    );
  }
}
