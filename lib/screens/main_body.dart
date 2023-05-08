import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../models/viewmodel/http_viewmodel.dart';
import '../widget/message_widget.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  MassageTxtField createState() => MassageTxtField();
}

class MassageTxtField extends State<Message> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  final HttpViewModel httpViewModel = HttpViewModel();
  late String message;
  final List<Widget> chatWidget = [];
  late final AsyncMemoizer _memoizer = AsyncMemoizer();
  final ScrollController _scrollController = ScrollController();

  bool _txt = true;
  Future? question;

  //매ㅐㅐㅐㅐㅐ우 중요!
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  void moveScroll() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent + 10,
        duration: Duration(milliseconds: 200), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF323540),
      appBar: AppBar(
        backgroundColor: const Color(0xFF323540),
        title: const Text(
          'Enjoy :D',
          style:
              TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF12a27f)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: ListView.builder(
                controller: _scrollController,
                itemCount: chatWidget.length,
                itemBuilder: (context, index) {
                  print("asdasd");

                  return chatWidget[index];
                }),
          ),
          Expanded(
            flex: 1,
            child: FutureBuilder(
              future: question,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                
                  return Column(
                    children: [
                      Expanded(child: Container()),
                      const SpinKitThreeBounce(color: Colors.white, size: 18),
                      const SizedBox(height: 16),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('ERROR: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  return const SizedBox.shrink();
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
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
                  enabledBorder: OutlineInputBorder(
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
                  suffixIcon: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      padding: EdgeInsets.all(25),
                      iconSize: 35,
                      splashColor: Colors.grey,
                      splashRadius: _txt ? 0.1 : 27.0,
                      onPressed: _txt ? null : () {
                        setState(() {
                          question =
                              httpViewModel.generateText(_controller.text);
                          message = _controller.text;
                          chatWidget.add(GptChat(message: message, divisionChat: true));
                          _controller.clear();
                        });

                            },
                      icon: Icon(Icons.send,
                          color: _txt ? Colors.grey : Colors.blue),
                    ),
                  )),
              style: const TextStyle(fontSize: 15, color: Colors.white),
              controller: _controller,
              onChanged: (text) {
                setState(() {
                  _txt = text.isEmpty;
                });
              }),
        ],
      ),
    );
  }
}
