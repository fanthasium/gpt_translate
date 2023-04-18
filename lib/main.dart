import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const apiKey = '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';
const apiUrl = 'https://api.openai.com/v1/completions';

void main() {
  runApp(const MainApp());

  String prompt = "what is elephant?";
  Future<String> data = generateText(prompt);
  data.then((value) {
    print(value);
  });
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF323540) ,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppBar(
            backgroundColor: Color(0xFF323540),
            title: const Text(
              'Enjoy',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
              color: Color(0xFF12a27f)),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(2.0),
              child: TextField(
                maxLines: null,
                textAlignVertical: TextAlignVertical.center,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(25),
                  hintText: 'Enter some txt',
                  hintStyle: TextStyle(fontSize: 13,color: Colors.grey.withOpacity(0.8)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20),bottom: Radius.circular(40))
                  ),
                  labelText: 'Q:',
                ),
                style: TextStyle(fontSize: 20,color: Colors.white),
                controller: _controller,
              ),
            ),
        /*  TextButton(
              onPressed: () {
                String prompt = _controller.text;
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ResultPage(prompt)));
              },
              child: const Text("Get Result"))*/
        ],
      ),
    );
  }
}

class ResultPage extends StatefulWidget {
  final String prompt;

  const ResultPage(this.prompt, {super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Text(widget.prompt),
      body: FutureBuilder<String>(
        future: generateText(widget.prompt),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Text('${snapshot.data}');
          }
        },
      ),
    );
  }
}

//future 은 비동기적 작업 수행후 그 결과를 나중에 처리하기 위한 객체 -> Gpt는 답변이 느리기때문에 필요
Future<String> generateText(String prompt) async {
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
      'top_p': 1,
      'frequency_penalty': 0,
      'presence_penalty': 0
    }),
  );

  Map<String, dynamic> newresponse =
      jsonDecode(utf8.decode(response.bodyBytes));

  return newresponse['choices'][0]['text'];
}
