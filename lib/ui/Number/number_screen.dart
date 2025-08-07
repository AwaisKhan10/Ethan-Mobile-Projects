import 'package:flutter/material.dart';
import 'package:flutter_application_ethan/core/constants/colors.dart';
import 'package:flutter_application_ethan/ui/Otp/otp_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:country_picker/country_picker.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({super.key});

  @override
  State<NumberScreen> createState() => _NumberScreen();
}

class _NumberScreen extends State<NumberScreen> {
  Country selectedCountry = Country(
    phoneCode: '1',
    countryCode: 'US',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'United States',
    example: '2015550123',
    displayName: 'United States',
    displayNameNoCountryCode: 'United States',
    e164Key: '',
  );
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 120),
              const SizedBox(height: 12),
              Text(
                "Please enter your valid phone \nnumber We will send you a 4-digit \ncode to verify your account.",
                style: GoogleFonts.orbitron(
                  fontSize: 14,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          onSelect: (country) {
                            setState(() {
                              selectedCountry = country;
                            });
                          },
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            '${selectedCountry.flagEmoji} +${selectedCountry.phoneCode}',
                            style: GoogleFonts.orbitron(
                              fontSize: 14,
                              color: blackColor,
                            ),
                          ),
                          SizedBox(width: 6),
                          const Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "331 623 8413",
                          hintStyle: GoogleFonts.orbitron(
                            fontSize: 14,
                            color: blackColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7FEFE9),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    String fullNumber =
                        '+${selectedCountry.phoneCode}${_phoneController.text}';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            OTPScreen(phoneNumber: fullNumber),
                      ),
                    );
                  },
                  child: Text(
                    "Continue",
                    style: GoogleFonts.orbitron(
                      fontSize: 14,
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
