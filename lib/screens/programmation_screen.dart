import 'package:flutter/material.dart';
import 'package:pauseguitare/pages/programmation_page.dart';
import 'package:pauseguitare/widgets/shared/bottom_navbar.dart';
import 'package:pauseguitare/widgets/shared/floating_button.dart';
import 'package:pauseguitare/widgets/shared/navbar.dart';

class ProgrammationScreen extends StatelessWidget {
  const ProgrammationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Navbar(),
      // extendBodyBehindAppBar: true,
      body: ProgrammationPage(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingButton(),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
