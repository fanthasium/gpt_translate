

import 'package:flutter/cupertino.dart';
import '../repository/http_repository.dart';
import '../shared_pref.dart';

class HttpViewModel extends ChangeNotifier {
  final HttpRepository repository = HttpRepository();
  final SharedPreferencesUtils _prefs = SharedPreferencesUtils.instance;

  Future<String> generateText(String prompt) async {
    await SharedPreferencesUtils.instance.init();

    _prefs.setString('ASSISTANT_MSG', prompt);
    print("a aaaa ${_prefs.getString('ASSISTANT_MSG')}");
    print("a aaaa ${generateText}");
    return await repository.responseText(prompt: prompt);
  }



}
