import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pauseguitare/theme/app_colors.dart';
import 'package:pauseguitare/widgets/home/artists_list.dart';
import 'package:pauseguitare/widgets/home/countdown.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/fond.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 2 - 100,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.secondary.withAlpha(0), AppColors.secondary],
                transform: GradientRotation(pi / 2),
                stops: [0.3, 0.6],
              ),
            ),
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: MediaQuery.of(context).size.width * 0.9,
                ),
                Countdown(),
                ArtistsList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
