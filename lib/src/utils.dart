
// Fonctiononctions utilitaires

import 'dart:convert';

String mapToQuery(Map<String, String> map, {Encoding encoding}) {
  var pairs = <List<String>>[];
  map.forEach((key, value) => pairs.add([
    Uri.encodeQueryComponent(key, encoding: encoding ?? utf8),
    Uri.encodeQueryComponent(value, encoding: encoding ?? utf8)
  ]));
  return pairs.map((pair) => '${pair[0]}=${pair[1]}').join('&');
}