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
    await SharedPreferencesUtils.instance.init();


    // 이전 대화를 저장하는 리스트
    final previousSentences = <String>[];

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
            {"role": "assistant", "content": _prefs.getString('ASSISTANT_MSG')},
            // {"role": "system", "content": "now you are the translator"}
          ],
          'max_tokens': 1000,
          'temperature': 0.5,
          'top_p': 0.6,
          'frequency_penalty': 0.5,
          'presence_penalty': 0.7
        }),
      );

      return jsonDecode(utf8.decode(response.bodyBytes));
    }
  }

