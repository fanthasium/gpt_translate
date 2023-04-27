import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gpt_translate/widget/gpt_chat.dart';
import 'package:gpt_translate/widget/msg_widget.dart';
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

  @override
  void setState(VoidCallback fn) {
    print("main");
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF323540),
      appBar: AppBar(
        backgroundColor: const Color(0xFF323540),
        title: const Text(
          'Enjoy :D',
          style: TextStyle(
              fontWeight: FontWeight.w700, color: Color(0xFF12a27f)),
        ),
      ),
      body: Column(
        children:  const [
          Message(),
        ],
      ),
    );
  }

}

