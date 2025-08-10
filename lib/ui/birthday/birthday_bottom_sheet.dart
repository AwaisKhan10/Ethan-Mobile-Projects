import 'package:flutter/material.dart';
import 'package:flutter_application_ethan/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class BirthdayBottomSheet extends StatefulWidget {
  const BirthdayBottomSheet({super.key});

  @override
  State<BirthdayBottomSheet> createState() => _BirthdayBottomSheetState();
}

class _BirthdayBottomSheetState extends State<BirthdayBottomSheet> {
  int selectedDay = 11;
  String month = "July";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Birthday", style: GoogleFonts.orbitron(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 4),
          Text(
            "$selectedDay",
            style: GoogleFonts.orbitron(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Text(month, style: GoogleFonts.orbitron(color: Colors.white, fontSize: 20)),
          const SizedBox(height: 16),
          calendarGrid(),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF80FFF1),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text("Save", style: GoogleFonts.orbitron(color: Colors.black, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget calendarGrid() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 31,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        crossAxisSpacing: 6,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (_, index) {
        final day = index + 1;
        final isFixedPurple = day >= 1 && day <= 7;
        final isSelected = day == selectedDay;

        Color? bgColor;
        Color textColor = Colors.white;

        if (isFixedPurple) {
          bgColor = Color(0xFF581C87);
        } else if (isSelected) {
          bgColor = const Color(0xFF80FFF1);
          textColor = Colors.black;
        } else {
          bgColor = Colors.transparent;
          textColor = Colors.white70;
        }

        return GestureDetector(
          onTap: isFixedPurple
              ? null
              : () {
                  setState(() {
                    selectedDay = day;
                  });
                },
          child: Container(
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
              border: isFixedPurple || isSelected
                  ? null
                  : Border.all(color: blackColor, width: 1),
            ),
            alignment: Alignment.center,
            child: Text(
              "$day",
              style: GoogleFonts.orbitron(
                color: textColor,
                fontSize: 14,
              ),
            ),
          ),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_application_ethan/core/constants/colors.dart';
// import 'package:google_fonts/google_fonts.dart';

// class BirthdayBottomSheet extends StatefulWidget {
//   const BirthdayBottomSheet({super.key});

//   @override
//   State<BirthdayBottomSheet> createState() => _BirthdayBottomSheetState();
// }

// class _BirthdayBottomSheetState extends State<BirthdayBottomSheet> {
//   int selectedDay = 11;
//   String month = "July";
//   int selectedYear = 2025;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
//       decoration: const BoxDecoration(
//         color: Colors.black,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text("Birthday", style: GoogleFonts.orbitron(color: Colors.white70, fontSize: 14)),
//           const SizedBox(height: 4),
//           Text("5", style: GoogleFonts.orbitron(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
//           Text(month, style: GoogleFonts.orbitron(color: Colors.white, fontSize: 20)),
//           const SizedBox(height: 16),
//           calendarGrid(),
//           const SizedBox(height: 24),
//           SizedBox(
//             width: double.infinity,
//             height: 50,
//             child: ElevatedButton(
//               onPressed: () => Navigator.pop(context),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF80FFF1),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//               ),
//               child: Text("Save", style: GoogleFonts.orbitron(color: whiteColor, fontSize: 16)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget calendarGrid() {
//     return GridView.builder(
//       shrinkWrap: true,
//       itemCount: 31,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 7,
//         crossAxisSpacing: 6,
//         mainAxisSpacing: 12,
//       ),
//       itemBuilder: (_, index) {
//         final day = index + 1;
//         final isSelected = day == selectedDay;

//         return GestureDetector(
//           onTap: () {
//             setState(() {
//               selectedDay = day;
//             });
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               color: isSelected ? const Color(0xFF80FFF1) : Colors.transparent,
//               shape: BoxShape.circle,
//               border: Border.all(color: Colors.white24),
//             ),
//             alignment: Alignment.center,
//             child: Text(
//               "$day",
//               style: GoogleFonts.orbitron(
//                 color: isSelected ? Colors.black : Colors.white70,
//                 fontSize: 14,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

