import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class FlutterChat extends StatelessWidget {
  final bool isCurrentUser;
  FlutterChat({required this.isCurrentUser });

  @override
  Widget build(BuildContext context) {
    return ChatPage();
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});


  State<ChatPage> createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {

  final bool isCurrentUser = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Align(
        // align the child within the container
        alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
        child: DecoratedBox(
          // chat bubble decoration
          decoration: BoxDecoration(
            color: isCurrentUser ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'hi',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: isCurrentUser ? Colors.white : Colors.black87),
            ),
          ),
        ),
      ),

    );


  }

}
