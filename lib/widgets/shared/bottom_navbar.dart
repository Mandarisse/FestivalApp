// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pauseguitare/providers/bottom_navbar_provider.dart';
import 'package:pauseguitare/theme/app_colors.dart';
import 'package:provider/provider.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(color: AppColors.tertiary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              // inspect('prog');
              // stocker l'indice de l'écran dans le provider
              context.read<BottomNavbarProvider>().screenIndex = 1;

              // naviguer vers une route nommée
              context.goNamed('programmation');
            },
            child: Column(
              spacing: 3,
              children: [
                Container(
                  width: 60,
                  height: 4,
                  color: context.watch<BottomNavbarProvider>().screenIndex == 1
                      ? AppColors.primary
                      : Colors.transparent,
                ),
                Icon(Icons.music_note, size: 40, color: Colors.white),
                Text(
                  'PROG',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              // inspect('billets');
              context.read<BottomNavbarProvider>().screenIndex = 2;
            },
            child: Column(
              spacing: 3,
              children: [
                Container(
                  width: 60,
                  height: 4,
                  color: context.watch<BottomNavbarProvider>().screenIndex == 2
                      ? AppColors.primary
                      : Colors.transparent,
                ),
                Icon(Icons.confirmation_num, size: 40, color: Colors.white),
                Text(
                  'BILLETS',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(width: 50),
          InkWell(
            onTap: () {
              // inspect('edito');
              context.read<BottomNavbarProvider>().screenIndex = 3;
            },
            child: Column(
              spacing: 3,
              children: [
                Container(
                  width: 60,
                  height: 4,
                  color: context.watch<BottomNavbarProvider>().screenIndex == 3
                      ? AppColors.primary
                      : Colors.transparent,
                ),
                Icon(Icons.edit_document, size: 40, color: Colors.white),
                Text(
                  'EDITO',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              // inspect('menu');
              context.read<BottomNavbarProvider>().screenIndex = 4;
            },
            child: Column(
              spacing: 3,
              children: [
                Container(
                  width: 60,
                  height: 4,
                  color: context.watch<BottomNavbarProvider>().screenIndex == 4
                      ? AppColors.primary
                      : Colors.transparent,
                ),
                Icon(Icons.menu, size: 40, color: Colors.white),
                Text(
                  'MENU',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
