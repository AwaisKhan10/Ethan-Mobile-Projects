import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomKeypad extends StatelessWidget {
  final void Function(String) onDigitPressed;
  final VoidCallback onBackspacePressed;

  const CustomKeypad({
    super.key,
    required this.onDigitPressed,
    required this.onBackspacePressed,
  });

  Widget buildKey(String text, {VoidCallback? onTap}) {
    return TextButton(
      onPressed: onTap ?? () => onDigitPressed(text),
      child: Text(
        text,
        style: GoogleFonts.orbitron(
          color: Colors.black,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // ✅ White background for entire keypad
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [buildKey('1'), buildKey('2'), buildKey('3')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [buildKey('4'), buildKey('5'), buildKey('6')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [buildKey('7'), buildKey('8'), buildKey('9')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildKey(''),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: buildKey('0'),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: onBackspacePressed,
                  child: const Icon(Icons.backspace, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
