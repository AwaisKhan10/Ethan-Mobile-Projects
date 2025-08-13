// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_ethan/ui/profile/profile_screen.dart';
import 'package:flutter_application_ethan/ui/root/root_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget {
  String? name;
  String? image;
  ChatScreen({required this.image, required this.name});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  bool isTyping = false;

  List<Message> messages = [
    Message(
      text:
          "Hi Jake, how are you? I saw on the app that we've crossed paths several times this week 😄",
      isMe: false,
    ),
    Message(
      text:
          "Haha truly! Nice to meet you Grace! What about a cup of coffee today evening? ☕",
      isMe: true,
    ),
    Message(text: "Sure, let's do it! 😊", isMe: false),
    Message(
      text: "Great I will write later the exact time and place. See you soon!",
      isMe: true,
    ),
  ];

  void sendMessage(String text, {bool fromMe = true}) {
    if (text.trim().isEmpty) return;
    setState(() {
      messages.add(Message(text: text.trim(), isMe: fromMe));
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => RootScreen(selectedScreen: 2),
          ),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              // HEADER
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.pink, Colors.orange],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage("${widget.image}"),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "${widget.name}",
                      style: GoogleFonts.orbitron(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "Exit Booth",
                      style: GoogleFonts.orbitron(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(color: Colors.white24, thickness: 0.5),

              // CHAT LIST
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msg = messages[index];
                    return Align(
                      alignment: msg.isMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.75,
                        ),
                        decoration: BoxDecoration(
                          color: msg.isMe
                              ? Colors.white
                              : const Color(0xFF140009),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          msg.text,
                          style: GoogleFonts.orbitron(
                            color: msg.isMe ? Colors.black : Colors.white,
                            fontSize: 14,
                            height: 1.4,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // MESSAGE INPUT
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: _controller,
                          style: GoogleFonts.orbitron(
                            color: Colors.black,
                            fontSize: 14,
                          ),

                          onChanged: (value) {
                            setState(() {
                              isTyping = value.trim().isNotEmpty;
                            });
                          },
                          onSubmitted: (text) => sendMessage(text),

                          decoration: InputDecoration(
                            hintText: "Your message",
                            hintStyle: GoogleFonts.orbitron(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(
                      Icons.access_time,
                      color: Colors.white,
                      size: 26,
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {
                        if (isTyping) {
                          sendMessage(_controller.text);
                          setState(() => isTyping = false);
                        } else {
                          // Mic button action here
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isTyping ? Icons.send : Icons.mic,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Message {
  final String text;
  final bool isMe;
  Message({required this.text, required this.isMe});
}
