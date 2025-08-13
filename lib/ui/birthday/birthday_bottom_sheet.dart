import 'package:flutter/material.dart';
import 'package:flutter_application_ethan/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class BirthdayBottomSheet extends StatefulWidget {
  const BirthdayBottomSheet({super.key});

  @override
  State<BirthdayBottomSheet> createState() => _BirthdayBottomSheetState();
}

class _BirthdayBottomSheetState extends State<BirthdayBottomSheet> {
  int selectedDay = 1;
  int selectedYear = DateTime.now().year;
  int currentMonthIndex = DateTime.now().month - 1;

  final List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  void previousMonth() {
    setState(() {
      currentMonthIndex = (currentMonthIndex - 1 + 12) % 12;
      if (selectedDay > daysInMonth(currentMonthIndex, selectedYear)) {
        selectedDay = daysInMonth(currentMonthIndex, selectedYear);
      }
    });
  }

  void nextMonth() {
    setState(() {
      currentMonthIndex = (currentMonthIndex + 1) % 12;
      if (selectedDay > daysInMonth(currentMonthIndex, selectedYear)) {
        selectedDay = daysInMonth(currentMonthIndex, selectedYear);
      }
    });
  }

  int daysInMonth(int monthIndex, int year) {
    int month = monthIndex + 1;
    if (month == 2) {
      return (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) ? 29 : 28;
    }
    if ([4, 6, 9, 11].contains(month)) return 30;
    return 31;
  }

  @override
  Widget build(BuildContext context) {
    final int totalDays = daysInMonth(currentMonthIndex, selectedYear);

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Birthday",
            style: GoogleFonts.orbitron(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            "$selectedDay",
            style: GoogleFonts.orbitron(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_left,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: previousMonth,
              ),
              Text(
                months[currentMonthIndex],
                style: GoogleFonts.orbitron(color: Colors.white, fontSize: 20),
              ),
              IconButton(
                icon: const Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: nextMonth,
              ),
            ],
          ),
          const SizedBox(height: 16),
          calendarGrid(totalDays),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(
                context,
                "${months[currentMonthIndex]} $selectedDay, $selectedYear",
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF80FFF1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Save",
                style: GoogleFonts.orbitron(color: Colors.black, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget calendarGrid(int totalDays) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: totalDays,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        crossAxisSpacing: 6,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (_, index) {
        final day = index + 1;
        final isSelected = day == selectedDay;
        final isFixedPurple = day >= 1 && day <= 7; // fixed purple dates

        Color? bgColor;
        Color textColor = Colors.white;

        if (isFixedPurple) {
          bgColor = const Color(0xFF581C87);
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
              style: GoogleFonts.orbitron(color: textColor, fontSize: 14),
            ),
          ),
        );
      },
    );
  }
}
