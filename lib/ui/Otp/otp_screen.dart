import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_ethan/core/custom_widgets/custom_keypad.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNumber;
  const OTPScreen({super.key, required this.phoneNumber});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  List<String> otp = ['', '', '', ''];
  int currentIndex = 0;
  int remainingSeconds = 60;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer?.cancel();
    remainingSeconds = 60;
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (remainingSeconds == 0) {
        t.cancel();
      } else {
        setState(() => remainingSeconds--);
      }
    });
  }

  void addDigit(String digit) {
    if (currentIndex < 4) {
      setState(() {
        otp[currentIndex] = digit;
        currentIndex++;
      });
      if (currentIndex == 4) {
        Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const PlaceholderScreen()),
          );
        });
      }
    }
  }

  void deleteDigit() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        otp[currentIndex] = '';
      });
    }
  }

  // Widget buildKey(String text, {VoidCallback? onTap}) {
  //   return GestureDetector(
  //     onTap: onTap ?? () => addDigit(text),
  //     child: Container(
  //       height: 60,
  //       width: 60,
  //       margin: const EdgeInsets.all(8),
  //       decoration: BoxDecoration(
  //         color: whiteColor,
  //         borderRadius: BorderRadius.circular(8),
  //       ),
  //       alignment: Alignment.center,
  //       child: Text(
  //         text,
  //         style: GoogleFonts.orbitron(color: blackColor, fontSize: 24),
  //       ),
  //     ),
  //   );
  // }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String timeDisplay =
        '${(remainingSeconds ~/ 60).toString().padLeft(2, '0')}:${(remainingSeconds % 60).toString().padLeft(2, '0')}';

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              timeDisplay,
              style: GoogleFonts.orbitron(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Type the verification\ncode\nwe've sent you",
              style: GoogleFonts.orbitron(fontSize: 18, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: otp.map((digit) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  width: 70,
                  height: 67,
                  decoration: BoxDecoration(
                    color: const Color(0xFF581C87),

                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    digit,
                    style: GoogleFonts.orbitron(
                      fontSize: 34,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 32),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomKeypad(
                  onDigitPressed: addDigit,
                  onBackspacePressed: deleteDigit,
                ),

                TextButton(
                  onPressed: () {
                    startTimer();
                  },
                  child: Text(
                    "Send again",
                    style: GoogleFonts.orbitron(
                      fontSize: 14,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: const Center(
        child: Text(
          "You are logged in ✅",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
