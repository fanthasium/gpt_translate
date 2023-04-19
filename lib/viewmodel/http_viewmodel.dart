

import '../repositiory/http_repository.dart';

class HttpViewModel {
  final HttpRepository repository;

  HttpViewModel({required this.repository});

  Future<String> generateText(String prompt) async {
    return await repository.responseText(prompt: prompt);
  }
}

