import 'package:flutter/material.dart';
import 'package:flutter_application_ethan/core/constants/colors.dart';
import 'package:flutter_application_ethan/core/custom_widgets/common_widgets.dart';
import 'package:flutter_application_ethan/ui/iam/i_am_screen.dart';
import 'package:flutter_application_ethan/ui/root/root_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
              const SizedBox(height: 40),
              Center(
                child: Container(
                  height: 240,
                  width: 240,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: blackColor,
                  ),
                  child: Image.asset("assets/dynamic_assets/chat.png"),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                "Enable notification’s",
                textAlign: TextAlign.center,
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Get push-notification when you get\nthe match or receive a message.",
                textAlign: TextAlign.center,
                style: GoogleFonts.orbitron(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              continueButton(context, RootScreen(selectedScreen: 0)),
            ],
          ),
        ),
      ),
    );
  }
}
