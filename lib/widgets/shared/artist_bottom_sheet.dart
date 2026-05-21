import 'package:flutter/material.dart';
import 'package:pauseguitare/models/artist.dart';
import 'package:pauseguitare/theme/app_colors.dart';

class ArtistBottomSheet extends StatelessWidget {
  final Artist artist;

  const ArtistBottomSheet({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: AppColors.secondary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    image: DecorationImage(
                      opacity: 0.8,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'http://10.0.2.2:3000/images/artists/${artist.poster}',
                      ),
                    ),
                  ),
                  child: Column(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        artist.name!,
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(fontSize: 20, color: Colors.white),
                      ),
                      Row(
                        spacing: 3,
                        children: [
                          Icon(Icons.label_outline, color: Colors.white),
                          Text(
                            artist.musicTypes!.join(', '),
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 50,
          right: 0,
          child: Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {
                // inspect('clic');
                Navigator.pop(context);
              },
              icon: Icon(Icons.close),
            ),
          ),
        ),
      ],
    );
  }
}
