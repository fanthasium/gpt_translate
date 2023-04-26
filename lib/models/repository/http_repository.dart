
import 'dart:convert';

import 'package:gpt_translate/dto/chat_data.dart';

import '../http_module/http_module.dart';
class HttpRepository {
  final HttpModule _httpModule = HttpModule();


  Future<String> responseText({required String prompt}) async {
    final response = await _httpModule.post(prompt);

    print("chat bot ${response['choices'][0]['message']['content']}");

    return await response['choices'][0]['message']['content'];
  }



}