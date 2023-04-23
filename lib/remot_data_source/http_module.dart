import 'dart:convert';
import 'package:gpt_translate/shared_pref.dart';
import 'package:http/http.dart' as http;


const apiKey = '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';
const apiUrl = 'https://api.openai.com/v1/chat/completions';

class HttpModule {

  HttpModule._internal();
  static final HttpModule _singleton = HttpModule._internal();
  factory HttpModule() => _singleton;

  final SharedPreferencesUtils _prefs = SharedPreferencesUtils.instance;

  Future<Map<String, dynamic>> post(String prompt) async {

    print("previous txt ${_prefs.getString(key: 'ASSISTANT_MSG')}");


    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey'
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "user", "content": prompt},
          {"role": "assistant", "content":"${ _prefs.getString(key:'ASSISTANT_MSG')}"},
          {"role": "system", "content": "너는 지금부터 베트남어는 한국어로 답을 해줘야해"}
        ],
        'max_tokens': 1000,
        'temperature': 0.95,
        'top_p': 0.9,
        'frequency_penalty': 0.5,
        'presence_penalty': 0.5
      }),
    );

    return jsonDecode(utf8.decode(response.bodyBytes));
  }
}

