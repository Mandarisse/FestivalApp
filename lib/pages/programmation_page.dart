import 'package:flutter/material.dart';

class ProgrammationPage extends StatelessWidget {
  const ProgrammationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [Text('programmation')],
        ),
      ),
    );
  }
}
