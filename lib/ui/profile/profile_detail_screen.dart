import 'package:flutter/material.dart';
import 'package:flutter_application_ethan/core/constants/colors.dart';
import 'package:flutter_application_ethan/ui/birthday/birthday_bottom_sheet.dart';
import 'package:flutter_application_ethan/ui/profile/final_profile_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 80),
            Align(
              alignment: Alignment.topRight,
               child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const FinalProfileScreen()),
      );
    },
              child: Text("Skip", style: GoogleFonts.orbitron(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 16)),
            ),),
            Spacer(),
                 Container(
                 width: 101,
                 height: 106,
                decoration: BoxDecoration(
                 color: Colors.white,
                   borderRadius: BorderRadius.circular(30), // same as width/height / 2
                  ),
              child: Stack(
                children: [
                 Container(
                 width: 101,
                 height: 106,
                decoration: BoxDecoration(
                 color: Colors.white,
                 image: DecorationImage(image: AssetImage("assets/dynamic_assets/photo.png")),
                   borderRadius: BorderRadius.circular(30), // same as width/height / 2
                  ),),
                  // const CircleAvatar(
                  //   radius: 38,
                  //   backgroundImage: AssetImage('assets/profile.jpg'), 
                  // ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.deepPurple,
                      child: const Icon(Icons.photo_camera, size: 20,color: whiteColor,),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 40),
            buildTextField("First name", "David"),
            const SizedBox(height: 12),
            buildTextField("Last name", "Peterson"),
            const SizedBox(height: 12),
            GestureDetector(
  onTap: () {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const BirthdayBottomSheet(),
    );
  },
  child: Container(
    height: 56,
    decoration: BoxDecoration(
      color: const Color(0xFF2B0D0D),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.calendar_month, color: Colors.white),
        const SizedBox(width: 8),
        Text(
          "Choose birthday date",
          style: GoogleFonts.orbitron(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
),

            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (_) => const BirthdayScreen()));
            //   },
            //   child: Container(
            //     height: 56,
            //     decoration: BoxDecoration(
            //       color: const Color(0xFF2B0D0D),
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //     child:  Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Icon(Icons.calendar_month, color: Colors.white),
            //         SizedBox(width: 8),
            //         Text("Choose birthday date", style: GoogleFonts.orbitron(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold)),
            //       ],
            //     ),
            //   ),
            // ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF80FFF1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Confirm", style: GoogleFonts.orbitron(color: whiteColor)),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.orbitron(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
      const SizedBox(height: 6),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextFormField(
          initialValue: value,
          style: GoogleFonts.orbitron(color: Colors.black, fontSize: 14),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: InputBorder.none,
          ),
        ),
      ),
    ],
  );
}
}

//   Widget buildTextField(String label, String initialValue) {
//     return TextFormField(
//       initialValue: initialValue,
//       style: const TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(color: Colors.white),
//         filled: true,
//         fillColor: const Color(0xFF1E1E1E),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//     );
//   }
// }