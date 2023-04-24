import 'package:flutter/material.dart';
import 'package:gpt_translate/shared_pref.dart';

class FlutterChat extends StatelessWidget {
  final bool isCurrentUser;

  FlutterChat({super.key, required this.isCurrentUser });

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
  final SharedPreferencesUtils _pref = SharedPreferencesUtils.instance;
  final List<String> chat = [];

  final bool isCurrentUser = true;


  @override
  Widget build(BuildContext context) {
     SharedPreferencesUtils.instance.init();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Align(
        // align the child within the container
        alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
        child: DecoratedBox(
          // chat bubble decoration
          decoration: BoxDecoration(
            color: isCurrentUser ? const Color(0xFF454553) : Colors.grey[300],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text( 'asasasdasdasd asd dd a 123d' ,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: isCurrentUser ? Colors.white : Colors.black87),
            ),
          ),
        ),
      ),

    );


  }

}
