import 'dart:convert';
import 'package:gpt_translate/shared_pref.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';


class HttpModule {
  String? baseUrl = dotenv.env['API_URL'];
  String? apiKey = dotenv.env['API_KEY'];

  HttpModule._internal();
  static final HttpModule _singleton = HttpModule._internal();
  factory HttpModule() => _singleton;

  final SharedPreferencesUtils _prefs = SharedPreferencesUtils.instance;

  Future<Map<String, dynamic>> post(String prompt) async {

    print("previous txt ${apiKey}");


    final response = await http.post(
      Uri.parse(baseUrl!),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey'
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "system", "content": "너는 지금부터 계산기야"},
          {"role": "assistant", "content":"${ _prefs.getString(key:'ASSISTANT_MSG')}"},
          {"role": "user", "content": prompt},
        ],
        'max_tokens': 1000,
        'temperature': 0.95,
        'top_p': 0.9,
        'frequency_penalty': 0.5,
        'presence_penalty': 0.5
      }),
    );

    print("HTTP STATUS: ${response.statusCode} ${response.body}");

    return jsonDecode(utf8.decode(response.bodyBytes));
  }
}