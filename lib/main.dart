import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gpt_translate/widget/msg_widget.dart';



void main() => runApp(const MainApp());


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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF323540),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppBar(
            backgroundColor: const Color(0xFF323540),
            title: const Text(
              'Enjoy :D',
              style: TextStyle(
                  fontWeight: FontWeight.w700, color: Color(0xFF12a27f)),
            ),
          ),

          Expanded(child:  MassageWidget()),

        ],
      ),
    );
  }

}

