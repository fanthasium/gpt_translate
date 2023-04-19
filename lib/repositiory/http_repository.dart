
import '../remot_data_source/http_module.dart';


class HttpRepository {

  final HttpModule _httpModule = HttpModule();

  Future<String> responseText({required String prompt}) async {
    final response = await _httpModule.post(prompt);
    return response['choices'][0]['text'];
  }


}