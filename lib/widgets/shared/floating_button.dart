// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pauseguitare/providers/bottom_navbar_provider.dart';
import 'package:pauseguitare/theme/app_colors.dart';
import 'package:provider/provider.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // inspect('floating button');
        context.read<BottomNavbarProvider>().screenIndex = 0;
        context.goNamed('home');
      },
      backgroundColor: Colors.transparent,
      child: Container(
        width: 100,
        height: 100,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset('assets/images/heart.svg'),
      ),
    );
  }
}
