
// Fonctiononctions utilitaires

import 'dart:async';
import 'dart:convert';

import 'dart:io';

String mapToQuery(Map<String, String> map, {Encoding encoding}) {
  var pairs = <List<String>>[];
  map.forEach((key, value) => pairs.add([
    Uri.encodeQueryComponent(key, encoding: encoding ?? utf8),
    Uri.encodeQueryComponent(value, encoding: encoding ?? utf8)
  ]));
  return pairs.map((pair) => '${pair[0]}=${pair[1]}').join('&');
}

Future<String> readResponse(HttpClientResponse response) {
  final completer = Completer<String>();
  final contents = StringBuffer();
  response.transform(utf8.decoder).listen((data) {
    contents.write(data);
  }, onDone: () => completer.complete(contents.toString()));
  return completer.future;
}