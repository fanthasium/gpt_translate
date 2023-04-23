
import 'package:flutter/material.dart';


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
    return TextField(
        onTap: () {
          _focusNode;
        },
        focusNode: _focusNode ,
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
        onSubmitted: (value) {
          httpViewModel.generateText(value);
          _controller.clear();
        },
      );
  }
}
