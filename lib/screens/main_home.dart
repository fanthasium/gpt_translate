
import 'package:flutter/material.dart';
import 'package:gpt_translate/screens/main_body.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


void main() async{
  await dotenv.load(fileName: 'assets/.env');
  runApp(const MainApp());

}


class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      home: Message(),
    );
  }
}


