import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:pauseguitare/models/programme.dart';

class ProgrammeApi {
  /*
    récupérer tous les programmes
    Future équivaut à une promesse JS
  */
  Future<List<Programme>> getAll() async {
    Uri uri = Uri.parse('http://10.0.2.2:3000/programme');

    try {
      dynamic response = await http.get(uri);
      List results = jsonDecode(response.body);

      return results.map((data) => Programme.fromJSON(data)).toList();
    } catch (e) {
      inspect(e);
      throw Error();
    }
  }
}
