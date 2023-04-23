
import '../remot_data_source/http_module.dart';

class HttpRepository {
  final HttpModule _httpModule = HttpModule();


  Future<String> responseText({required String prompt}) async {
    final response = await _httpModule.post(prompt);

    print("chat bot ${response['choices'][0]['message']['content']}");
    return await response['choices'][0]['message']['content'];
  }



}