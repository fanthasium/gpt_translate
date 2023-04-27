import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gpt_translate/shared_pref.dart';

/*class FlutterChat extends StatelessWidget {
  final String? mes
  sage;
  final bool divisionChat;
  const FlutterChat({super.key, required this.message, required this.divisionChat});


  @override
  Widget build(BuildContext context) {
    return  ChatPage(message: message, divisionChat: divisionChat);
  }
}

class ChatPage extends StatefulWidget {

  final String? message;
  final bool divisionChat;
  const ChatPage({super.key, required this.message, required this.divisionChat});

  @override
  State<ChatPage> createState() => ChatPageState();
}*/

class GptChat extends StatelessWidget {
  final String? message;
  final bool divisionChat;

  const GptChat({super.key, required this.message, required this.divisionChat});

  @override
  Widget build(BuildContext context) {
     SharedPreferencesUtils.instance.init();
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Align(
              alignment: divisionChat ? Alignment.centerRight : Alignment.centerLeft,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: divisionChat ? const Color(0xFF454553) : Colors.grey[300],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: divisionChat
                      ? Text(
                      message!,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white)
                  )
                      : AnimatedTextKit(
                    isRepeatingAnimation: false,
                    animatedTexts: [
                    TypewriterAnimatedText(
                        message!,
                        textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.black87),
                        speed: const Duration(milliseconds: 70),
                        cursor: ""
                 )
                  ],

                  )
                ),
              ),
            ),
      );

  }

}
