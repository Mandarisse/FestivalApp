import 'package:flutter/material.dart';
import 'package:pauseguitare/pages/home_page.dart';
import 'package:pauseguitare/widgets/shared/bottom_navbar.dart';
import 'package:pauseguitare/widgets/shared/floating_button.dart';
import 'package:pauseguitare/widgets/shared/navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Navbar(isHome: true),
      extendBodyBehindAppBar: true,
      body: Homepage(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingButton(),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
