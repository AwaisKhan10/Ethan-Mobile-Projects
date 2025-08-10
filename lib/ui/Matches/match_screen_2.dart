import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_ethan/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchScreen2 extends StatefulWidget {
  const MatchScreen2({super.key});

  @override
  State<MatchScreen2> createState() => _MatchScreen2State();
}

class _MatchScreen2State extends State<MatchScreen2> {
   int seconds = 3;
  // int seconds = 312; 
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        t.cancel();
        bool isMatch = Random().nextBool(); // Random match or not
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => ResultScreen(isMatch: isMatch),
          ),
        );
      }
    });
  }

  String get timerText {
    int m = seconds ~/ 60;
    int s = seconds % 60;
    return "${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/dynamic_assets/girl.png',
                width: 200,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Jessica Parker, 23",
              style: GoogleFonts.orbitron(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: whiteColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Drink Served!",
              style: GoogleFonts.orbitron(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              timerText,
              style: GoogleFonts.orbitron(
                fontSize: 36,
                color: whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 295,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFF581C87),
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: Text(
                "Please wait for {name} to response",
                textAlign: TextAlign.center,
                style: GoogleFonts.orbitron(
                  fontSize: 14,
                  color: whiteColor,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: 295,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: Text(
                "Back To Lobby",
                style: GoogleFonts.orbitron(
                  fontSize: 14,
                  color: whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final bool isMatch;
  const ResultScreen({super.key, required this.isMatch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/dynamic_assets/girl.png',
                    width: 160,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/dynamic_assets/boy.png',
                    width: 160,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              isMatch ? "It's a MATCH!" : "It's NOT match,\n         Jake!",
              style: GoogleFonts.orbitron(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: isMatch ? Colors.green : Colors.purple,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 295,
              height: 56,
              decoration: BoxDecoration(
                color: isMatch ? Colors.green : Colors.cyanAccent,
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: Text(
                isMatch ? "Start Chatting!" : "Get your free Drink!",
                style: GoogleFonts.orbitron(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            
            Container(
              width: 295,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: Text(
                "Back To Lobby",
                style: GoogleFonts.orbitron(
                  fontSize: 16,
                  color: whiteColor,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'dart:async';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_ethan/core/constants/colors.dart';
// import 'package:google_fonts/google_fonts.dart';

// class MatchScreen2 extends StatefulWidget {
//   const MatchScreen2({super.key});

//   @override
//   State<MatchScreen2> createState() => _MatchScreen2State();
// }

// class _MatchScreen2State extends State<MatchScreen2> {
//   int seconds = 300; // 5 minutes in seconds
//   Timer? timer;

//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//   }

//   void startTimer() {
//     timer = Timer.periodic(const Duration(seconds: 1), (t) {
//       if (seconds > 0) {
//         setState(() {
//           seconds--;
//         });
//       } else {
//         t.cancel();
//         bool isMatch = Random().nextBool(); // Random match or not
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (_) => ResultScreen(isMatch: isMatch),
//           ),
//         );
//       }
//     });
//   }

//   String get timerText {
//     int m = seconds ~/ 60;
//     int s = seconds % 60;
//     return "${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}";
//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: blackColor,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image.asset(
//                 'assets/dynamic_assets/girl.png', 
//                 width: 200,
//                 height: 250,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(height: 12),
//             Text(
//               "Jessica Parker, 23",
//               style: GoogleFonts.orbitron(fontSize: 24, fontWeight: FontWeight.bold ,color: whiteColor),
//             ),
//             const SizedBox(height: 4),
//           Text(
//               "Drink Served!",
//               style: GoogleFonts.orbitron(fontSize: 14, color: Colors.grey),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               timerText,
//               style: GoogleFonts.orbitron(
//                 fontSize: 36,
//                 color: whiteColor,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Container(
//               width: 295,
//               height: 56,
//               decoration: BoxDecoration(
//                 color: Color(0xFF581C87),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               alignment: Alignment.center,
//               child: const Text(
//                 "Please wait for {name} to response",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 14),
//               ),
//             ),
//             const SizedBox(height: 12),
//             Container(
//               width: 295,
//               height: 56,
//               decoration: BoxDecoration(
//                 color: Colors.brown,
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               alignment: Alignment.center,
//               child: const Text(
//                 "Back To Lobby",
//                 style: TextStyle(fontSize: 14),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ResultScreen extends StatelessWidget {
//   final bool isMatch;
//   const ResultScreen({super.key, required this.isMatch});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Image.asset(
//                     'assets/dynamic_assets/girl.png',
//                     width: 120,
//                     height: 160,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Image.asset(
//                     'assets/dynamic_assets/boy.png',
//                     width: 120,
//                     height: 160,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Text(
//               isMatch ? "It's a MATCH!" : "It's NOT match, Jake!",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: isMatch ? Colors.green : Colors.purple,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Container(
//               width: 220,
//               height: 50,
//               decoration: BoxDecoration(
//                 color: isMatch ? Colors.green : Colors.cyanAccent,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               alignment: Alignment.center,
//               child: Text(
//                 isMatch ? "Start Chatting!" : "Get your free Drink!",
//                 style: const TextStyle(
//                   fontSize: 14,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 12),
//             Container(
//               width: 220,
//               height: 50,
//               decoration: BoxDecoration(
//                 color: Colors.brown,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               alignment: Alignment.center,
//               child: const Text(
//                 "Back To Lobby",
//                 style: TextStyle(fontSize: 14),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }