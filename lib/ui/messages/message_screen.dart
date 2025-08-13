// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_ethan/core/constants/colors.dart';
import 'package:flutter_application_ethan/ui/messages/chat_screen.dart';
import 'package:flutter_application_ethan/ui/profile/profile_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Messages',
                      style: GoogleFonts.orbitron(
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                        color: whiteColor,
                        fontSize: 32,
                      ),
                    ),
                  ),
                  _iconButton(context, Icons.tune_rounded, onTap: () {}),
                ],
              ),
            ),

            // Search
            _SearchField(),

            const SizedBox(height: 16),

            // Activities / Stories row
            SizedBox(
              height: 92,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (c, i) => _StoryAvatar(
                  imageUrl:
                      'https://i.pravatar.cc/150?img=${(i + 3) % 70}', // demo
                  label: i == 0 ? 'You' : _names[i % _names.length],
                  isYou: i == 0,
                ),
                separatorBuilder: (_, __) => const SizedBox(width: 14),
                itemCount: 8,
              ),
            ),

            // "Messages" label
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 6),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Messages',
                  style: GoogleFonts.orbitron(
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                    color: whiteColor,
                    fontSize: 24,
                  ),
                ),
              ),
            ),

            // Messages list
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _items.length,
                separatorBuilder: (_, __) => const Divider(
                  color: Color(0x22FFFFFF),
                  height: 24,
                  thickness: 1,
                ),
                itemBuilder: (context, index) {
                  final m = _items[index];
                  return _MessageTile(
                    name: m.name,
                    subtitle: m.subtitle,
                    time: m.time,
                    unreadCount: m.unread,
                    avatarUrl: m.avatarUrl,
                    typing: m.typing,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ChatScreen(image: m.avatarUrl, name: m.name),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconButton(
    BuildContext context,
    IconData icon, {
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: const Color(0x221FFFFFF),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(icon, size: 22, color: whiteColor),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: GoogleFonts.orbitron(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          color: whiteColor,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search, size: 22, color: Colors.grey),
          fillColor: whiteColor,
          filled: true,
          hintStyle: GoogleFonts.orbitron(
            fontWeight: FontWeight.w800,
            letterSpacing: 0.5,
            color: Colors.grey,
            fontSize: 14,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}

class _StoryAvatar extends StatelessWidget {
  final String imageUrl;
  final String label;
  final bool isYou;

  const _StoryAvatar({
    required this.imageUrl,
    required this.label,
    this.isYou = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => StoryScreen(
              imageUrl: imageUrl,
              avatarUrl: imageUrl,
              userName: label,
            ),
          ),
        );
      },
      child: Column(
        children: [
          // Ring + avatar
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: isYou
                  ? const LinearGradient(
                      colors: [Color(0xFFFF8A00), Color(0xFFFF2D55)],
                    )
                  : const LinearGradient(
                      colors: [Color(0xFF7F52FF), Color(0xFFFF2D55)],
                    ),
            ),
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              padding: const EdgeInsets.all(2),
              child: ClipOval(
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 64,
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: GoogleFonts.orbitron(
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageTile extends StatelessWidget {
  final String name;
  final String subtitle;
  final String time;
  final int unreadCount;
  final String avatarUrl;
  final bool typing;
  final VoidCallback onTap;

  const _MessageTile({
    required this.name,
    required this.subtitle,
    required this.time,
    required this.unreadCount,
    required this.avatarUrl,
    required this.typing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final subtitleStyle = GoogleFonts.orbitron(
      fontWeight: FontWeight.w800,
      letterSpacing: 0.5,
      fontStyle: typing ? FontStyle.italic : FontStyle.normal,
      color: whiteColor,
      fontSize: 12,
    );

    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
      leading: _AvatarRing(url: avatarUrl),
      title: Text(
        name,
        style: GoogleFonts.orbitron(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          fontStyle: typing ? FontStyle.italic : FontStyle.normal,
          color: whiteColor,
          fontSize: 16,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Text(
          typing ? 'Typing..' : subtitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: subtitleStyle,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _TimeBadge(time: time),
          const SizedBox(height: 6),
          if (unreadCount > 0) _UnreadDot(count: unreadCount),
        ],
      ),
    );
  }
}

class _AvatarRing extends StatelessWidget {
  final String url;
  const _AvatarRing({required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
      },
      child: Container(
        width: 52,
        height: 52,
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Color(0xFFFF8A00), Color(0xFFFF2D55)],
          ),
        ),
        child: ClipOval(child: Image.network(url, fit: BoxFit.cover)),
      ),
    );
  }
}

class _TimeBadge extends StatelessWidget {
  final String time;
  const _TimeBadge({required this.time});

  @override
  Widget build(BuildContext context) {
    // split like "23 min" -> ["23", "min"]
    final parts = time.split(' ');
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          parts.first,
          style: GoogleFonts.orbitron(color: whiteColor, fontSize: 10),
        ),
        const SizedBox(width: 2),
        Text(
          parts.length > 1 ? parts.sublist(1).join(' ') : '',
          style: GoogleFonts.orbitron(color: whiteColor, fontSize: 10),
        ),
      ],
    );
  }
}

class _UnreadDot extends StatelessWidget {
  final int count;
  const _UnreadDot({required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFFF2D55),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        '$count',
        style: GoogleFonts.orbitron(
          fontWeight: FontWeight.w500,
          color: whiteColor,
          fontSize: 12,
        ),
      ),
    );
  }
}

// --- Demo data ---
class _Msg {
  final String name, subtitle, time, avatarUrl;
  final int unread;
  final bool typing;
  _Msg(
    this.name,
    this.subtitle,
    this.time,
    this.avatarUrl, {
    this.unread = 0,
    this.typing = false,
  });
}

final _names = ['Emma', 'Ava', 'Sophia', 'Mia', 'Olivia', 'Liam', 'Noah'];

final _items = <_Msg>[
  _Msg(
    'Emelie',
    'Sticker 😍',
    '23 min',
    'https://i.pravatar.cc/150?img=32',
    unread: 1,
  ),
  _Msg(
    'Abigail',
    '…',
    '27 min',
    'https://i.pravatar.cc/150?img=15',
    unread: 2,
    typing: true,
  ),
  _Msg(
    'Elizabeth',
    'Ok, see you then.',
    '33 min',
    'https://i.pravatar.cc/150?img=12',
  ),
  _Msg(
    'Penelope',
    "Hey! What's up, long time..",
    '50 min',
    'https://i.pravatar.cc/150?img=29',
  ),
  _Msg(
    'Chloe',
    'Hello how are you?',
    '55 min',
    'https://i.pravatar.cc/150?img=21',
  ),
  _Msg(
    'Grace',
    'Great! I will write…',
    '1 hour',
    'https://i.pravatar.cc/150?img=5',
  ),
];

class StoryScreen extends StatefulWidget {
  final String imageUrl;
  final String userName;
  final String avatarUrl;

  const StoryScreen({
    super.key,
    required this.imageUrl,
    required this.userName,
    required this.avatarUrl,
  });

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  final StoryController controller = StoryController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Story content
          Positioned.fill(
            // ensure the story fills the whole screen
            child: StoryView(
              storyItems: [
                // Image
                StoryItem.pageImage(
                  url: widget.imageUrl,
                  controller: controller,
                  imageFit: BoxFit.cover,
                  duration: const Duration(seconds: 5),
                ),

                // Video (full-bleed)
                StoryItem.pageVideo(
                  "https://samplelib.com/lib/preview/mp4/sample-5s.mp4",
                  controller: controller,
                  imageFit: BoxFit.cover,
                ),
              ],
              controller: controller,
              repeat: false,
              onComplete: () => Navigator.pop(context),
            ),
          ),
          // Top bar: profile & name
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 50,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(widget.avatarUrl),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.userName,
                    style: GoogleFonts.orbitron(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          // Bottom message field
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _messageController,
                      style: GoogleFonts.orbitron(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: "Send message...",
                        hintStyle: GoogleFonts.orbitron(
                          color: whiteColor,
                          fontSize: 14,
                        ),
                        filled: true,
                        fillColor: whiteColor.withOpacity(0.02),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(width: 2, color: whiteColor),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {
                      if (_messageController.text.trim().isNotEmpty) {
                        print(
                          "Message to ${widget.userName}: ${_messageController.text}",
                        );
                        _messageController.clear();
                      }
                    },
                    icon: const Icon(Icons.send, color: whiteColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
