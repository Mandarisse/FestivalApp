import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pauseguitare/models/programme.dart';
import 'package:pauseguitare/widgets/programme/programme_item.dart';

class FilterForm extends StatefulWidget {
  final List<Programme> data;

  // état du formulaire
  final dynamic _formKey = GlobalKey<FormState>();

  FilterForm({super.key, required this.data});

  @override
  State<FilterForm> createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  // stocker la saisie
  String _searchValue = '';

  // stocker les données filtrées
  List<Programme> _filterProgramme = [];

  // initState est exécutée à l'affichage du widget
  @override
  void initState() {
    super.initState();

    // affecter les programmes au filtre des programmes à l'affichage du widget
    _filterProgramme = widget.data;

    // inspect(_filterProgramme);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              // widget permet d'accéder à la classe du widget à partir de la classe de l'état
              key: widget._formKey,
              child: TextFormField(
                decoration: InputDecoration(
                  hint: Text('Rechercher'),
                  suffixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  // inspect(value);
                  _searchValue = value;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: MediaQuery.of(context).size.height - 56 - 100 - 120,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _filterProgramme.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        DateFormat(
                          'E dd/MM',
                          'fr-FR',
                        ).format(DateTime.parse(_filterProgramme[index].day!)),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      ListView.builder(
                        // gérer le conflit de défilement entre la liste et l'écran
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            _filterProgramme[index].programmeArtists!.length,
                        itemBuilder: (context, indexProgramme) {
                          return ProgrammeItem(
                            programmeArtist: _filterProgramme[index]
                                .programmeArtists![indexProgramme],
                          );
                        },
                      ),
                    ],
                  );
                },
              ),

              //   color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}
