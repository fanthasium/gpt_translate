import 'package:flutter/material.dart';
import 'package:gpt_translate/dto/chat_data.dart';
import 'package:gpt_translate/shared_pref.dart';

class FlutterChat extends StatelessWidget {
  int num = 0;
  @override
  Widget build(BuildContext context) {
    return  ChatPage();
  }
}

class ChatPage extends StatefulWidget {

  @override
  State<ChatPage> createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {

  final bool isCurrentUser = false;

  final List<HttpResponse> item = [];


  @override
  Widget build(BuildContext context) {
     SharedPreferencesUtils.instance.init();
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Align(
              alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: isCurrentUser ? const Color(0xFF454553) : Colors.grey[300],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text( 'num',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: isCurrentUser ? Colors.white : Colors.black87),
                  ),
                ),
              ),
            ),
      );

  }

}
