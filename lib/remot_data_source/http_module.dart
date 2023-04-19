import 'dart:convert';

import 'package:http/http.dart' as http;


const apiKey = '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';
const apiUrl = 'https://api.openai.com/v1/completions';

class HttpModule {

  static final HttpModule _singleton = HttpModule._internal();

  factory HttpModule() => _singleton;

  HttpModule._internal();

  Future<Map<String, dynamic>> post(String prompt) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey'
      },
      body: jsonEncode({
        "model": "text-davinci-003",
        'prompt': prompt,
        'max_tokens': 1000,
        'temperature': 0,
        'top_p': 0,
        'frequency_penalty': 0,
        'presence_penalty': 0
      }),
    );

    return jsonDecode(utf8.decode(response.bodyBytes));
  }
}