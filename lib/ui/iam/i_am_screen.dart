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
  String selected = "Woman"; // default selected
  String? dropdownValue;

  final List<String> otherOptions = [
    "Non-binary",
    "Prefer not to say",
    "Custom",
  ];

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
              const SizedBox(height: 40),
              optionTile("Woman"),
              optionTile("Man"),
              dropdownTile("Choose another"),
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
          dropdownValue = null; // reset dropdown if not in use
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
            Icon(Icons.check, color: isSelected ? Colors.white : Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget dropdownTile(String title) {
    bool isSelected = selected == title;
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF2EE6D6) : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: dropdownValue,
        hint: Text(
          title,
          style: GoogleFonts.orbitron(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: isSelected ? Colors.white : Colors.grey,
        ),
        isExpanded: true,
        underline: const SizedBox(),
        dropdownColor: Colors.white,
        iconEnabledColor: isSelected ? Colors.white : Colors.black,
        items: otherOptions.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: GoogleFonts.orbitron(color: Colors.black, fontSize: 16),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selected = title; // mark dropdown as selected
            dropdownValue = newValue;
          });
        },
      ),
    );
  }
}
