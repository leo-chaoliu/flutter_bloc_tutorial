import 'dart:async';
import 'package:http/http.dart' as http;

class Api {
  final http.Client _client = http.Client();
  final header = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  Future<http.Response> get(endpoint) {
    return _client.get(endpoint, headers: header);
  }
}
