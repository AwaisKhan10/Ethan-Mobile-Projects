import 'package:flutter/material.dart';
import 'package:flutter_application_ethan/core/custom_widgets/common_widgets.dart';
import 'package:flutter_application_ethan/ui/passion/passion_screen.dart';
import 'package:flutter_application_ethan/ui/root/root_screen.dart';
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
                  skipButton(context, RootScreen()),
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
              continueButton(context, PassionsScreen()),
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
            if (isSelected) const Icon(Icons.check, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
