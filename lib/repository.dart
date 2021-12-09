import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_empat/person.dart';

class Repository {
  final uri = 'https://61b0d4613c954f001722a69f.mockapi.io/example';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(uri));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Person> listPerson = it.map((e) => Person.fromJson(e)).toList();

        return listPerson;
      } else {
        throw Exception('Failed to load album');
      }
    } catch (e) {
      return e.toString();
    }
  }
}
