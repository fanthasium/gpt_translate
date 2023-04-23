

import 'package:flutter/cupertino.dart';
import '../repository/http_repository.dart';
import '../shared_pref.dart';

class HttpViewModel extends ChangeNotifier {
  final HttpRepository repository = HttpRepository();
  final SharedPreferencesUtils _prefs = SharedPreferencesUtils.instance;

  Future<String> generateText(String prompt) async {
    await SharedPreferencesUtils.instance.init();

    final responseText = await repository.responseText(prompt: prompt);
    await _prefs.setString('ASSISTANT_MSG', value: responseText);
    return  responseText;
  }



}
