
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import '../viewmodel/http_viewmodel.dart';


class Message extends StatefulWidget{
  const Message({super.key});

  @override
  MassageTxtField createState() => MassageTxtField();
}

class MassageTxtField extends State<Message> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  final HttpViewModel httpViewModel = HttpViewModel();

  Future<String>? question;

  //매ㅐㅐㅐㅐㅐ우 중요!
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<String?>(
          future: question,
          builder: (context,snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const SpinKitThreeBounce(color: Colors.white, size: 18);
            }else if(snapshot.hasError){
              return Text('ERROR: ${snapshot.error}');
            } else{
              return const Text(''); //영 맘에들지 않는다..
            }
          },
        ),
        const SizedBox(height: 15,),
        TextField(
            onTap: () {
              _focusNode;
            },
            focusNode: _focusNode,
            maxLines: null,
            textAlignVertical: TextAlignVertical.center,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFF40414f),
              contentPadding: const EdgeInsets.all(30),
              hintText: 'Enter some txt',
              hintStyle: TextStyle(
                  fontSize: 13, color: Colors.grey.withOpacity(0.8)),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                  BorderSide(color: Color(0xFF40414f), width: 1.0)),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                  BorderSide(color: Color(0xFF40414f), width: 1.0)),
              labelText: 'Q:',
              labelStyle: TextStyle(
                  color: _focusNode.hasFocus
                      ? Colors.blueAccent
                      : Colors.grey.withOpacity(0.8),
                  fontSize: 23),
            ),
            style: const TextStyle(fontSize: 15, color: Colors.white),
            controller: _controller,
            onSubmitted: (value) async {
              setState(() {
              });
              question = httpViewModel.generateText(value);
             _controller.clear();
            },
          ),
      ],
    );
  }
}
