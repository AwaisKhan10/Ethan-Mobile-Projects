import 'package:flutter/material.dart';
import 'package:flutter_application_ethan/core/custom_widgets/common_widgets.dart';
import 'package:flutter_application_ethan/ui/passion/passion_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class IAmScreen extends StatefulWidget {
  const IAmScreen({super.key});

  @override
  State<IAmScreen> createState() => _IAmScreenState();
}

class _IAmScreenState extends State<IAmScreen> {
  String selected = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  backButton(context),
                  skipButton(context, const PassionsScreen()),
                ],
              ),
              const SizedBox(height: 80),
              // Text(
              //   "I am a",
              //   style: GoogleFonts.orbitron(
              //     color: Colors.white,
              //     fontSize: 28,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              const SizedBox(height: 40),
              optionTile("Woman"),
              optionTile("Man"),
              optionTile("Choose another"),
              const Spacer(),
              continueButton(context, const PassionsScreen()),
            ],
          ),
        ),
      ),
    );
  }

  Widget optionTile(String title) {
    bool isSelected = selected == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = title;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2EE6D6) : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.orbitron(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 16,
              ),
            ),
            if (isSelected)
              const Icon(Icons.check, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class IAmScreen extends StatefulWidget {
//   const IAmScreen({super.key});

//   @override
//   State<IAmScreen> createState() => _IAmScreenState();
// }

// class _IAmScreenState extends State<IAmScreen> {
//   String? selectedGender;

//   final List<String> genders = ["Woman", "Man", "Choose another"];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Top Bar
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.arrow_back, color: Colors.white),
//                     onPressed: () {},
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (_) => const PassionsScreen()),
//                       );
//                     },
//                     child: const Text("Skip", style: TextStyle(color: Colors.white)),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 40),

//               const Text(
//                 "I am a",
//                 style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 40),

//               // Gender Buttons
//               ...genders.map((gender) {
//                 bool isSelected = selectedGender == gender;
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       selectedGender = gender;
//                     });
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.only(bottom: 15),
//                     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
//                     decoration: BoxDecoration(
//                       color: isSelected ? const Color(0xFF30D1CC) : Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           gender,
//                           style: TextStyle(
//                             color: isSelected ? Colors.white : Colors.black,
//                             fontSize: 16,
//                           ),
//                         ),
//                         if (isSelected)
//                           const Icon(Icons.check, color: Colors.white)
//                       ],
//                     ),
//                   ),
//                 );
//               }),

//               const Spacer(),

//               // Continue Button
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF30D1CC),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (_) => const PassionsScreen()),
//                     );
//                   },
//                   child: const Text("Continue", style: TextStyle(color: Colors.white, fontSize: 16)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
