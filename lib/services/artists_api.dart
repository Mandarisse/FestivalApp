import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:pauseguitare/models/artist.dart';

class ArtistsApi {
  /*
    récupérer tous les artistes
    Future équivaut à une promesse JS
  */
  Future<List<Artist>> getAll() async {
    Uri uri = Uri.parse('http://10.0.2.2:3000/artists');

    try {
      dynamic response = await http.get(uri);
      List results = jsonDecode(response.body);

      return results.map((data) => Artist.fromJSON(data)).toList();
    } catch (e) {
      inspect(e);
      throw Error();
    }
  }
}
