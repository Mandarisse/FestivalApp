import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pauseguitare/services/programme_api.dart';
import 'package:pauseguitare/widgets/programme/filter_form.dart';

class ProgrammationPage extends StatelessWidget {
  const ProgrammationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ProgrammeApi().getAll(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // inspect(snapshot.requireData);
          return FilterForm(data: snapshot.requireData);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
