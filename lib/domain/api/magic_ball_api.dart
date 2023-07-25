import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

abstract class MagicBallApi {
  static const _urlHost = 'eightballapi.com';
  static const _urlPath = 'api';

  static Future<Map<String, dynamic>?> getData() async {
    final Uri url = Uri(
      scheme: 'https',
      host: _urlHost,
      path: _urlPath,
    );

    try {
      final response = await http.get(url);
      final Map<String, dynamic>? result = json.decode(response.body);
      
      return result;
      
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }
}
