

import 'package:flutter/cupertino.dart';
import 'package:gpt_translate/dto/chat_data.dart';
import '../../shared_pref.dart';
import '../repository/http_repository.dart';

class HttpViewModel extends ChangeNotifier {
  final HttpRepository repository = HttpRepository();
  final SharedPreferencesUtils _prefs = SharedPreferencesUtils.instance;

  Future<String> generateText(String prompt) async {
      final responseText = await repository.responseText(prompt: prompt);

      await _prefs.setString('ASSISTANT_MSG', value: responseText);
      await _prefs.setString('USER_MSG', value: prompt );

      return responseText;
    }
  }

