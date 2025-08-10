import 'package:flutter/material.dart';
import 'package:flutter_application_ethan/ui/iam/i_am_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class FinalProfileScreen extends StatelessWidget {
  const FinalProfileScreen({super.key});

   @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 10),
                Text(
                  'Profile',
                  style: GoogleFonts.orbitron(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.tune, color: Colors.white),
                  onPressed: () {
                       Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const IAmScreen()),
      );
  
                  },
                ),
              ],
            ),
            const SizedBox(height: 35),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                   Container(
                 width: 101,
                 height: 106,
                decoration: BoxDecoration(
                 color: Colors.white,
                 image: DecorationImage(image: AssetImage("assets/dynamic_assets/photo.png")),
                   borderRadius: BorderRadius.circular(30), // same as width/height / 2
                  ),),
        //            ClipRRect(
        //   borderRadius: BorderRadius.circular(20),
        //   child: Image.network(
        //     'https://randomuser.me/api/portraits/men/1.jpg',
        //     width: 130,
        //     height: 130,
        //     fit: BoxFit.cover,
        //   ),
        // ),

        // Bottom-left wrench icon
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(
              Icons.build, // Wrench icon
              color: Colors.white,
              size: 20,
            ),
          ),
        ),

        // Bottom-right camera icon in purple circle
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.deepPurple,
              child: const Icon(
                Icons.camera_alt,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      
                  // Container(
                  //   width: 110,
                  //   height: 110,
                  //   decoration: const BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  // Container(
                  //   width: 100,
                  //   height: 100,
                  //   decoration: const BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     color: Colors.deepPurple,
                  //   ),
                  //   child: const CircleAvatar(
                  //     radius: 48,
                  //     backgroundImage: NetworkImage(
                  //       'https://randomuser.me/api/portraits/men/1.jpg',
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   bottom: 0,
                  //   right: 0,
                  //   child: 
                  // //     Container(
                  // //   width: 110,
                  // //   height: 110,
                  // //   decoration: const BoxDecoration(
                  // //     shape: BoxShape.circle,
                  // //     color: Colors.white,
                  // //   ),
                  // // ),
                  //    CircleAvatar(
                  //     radius: 14,
                  //     backgroundColor: Colors.white,
                  //     child: Icon(Icons.camera_alt, size: 16, color: Colors.deepPurple),
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 1),
            // Fields
            _buildLabeledField('First name', 'David'),
            _buildLabeledField('Last name', 'Peterson'),
            _buildLabeledField('Email', 'asdfksaft@gmail.com'),
            _buildLabeledField('Phone Number', 'xxxxxxxxxxx'),
            const SizedBox(height: 20),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _IconButtonWithLabel(icon: Icons.block, label: 'Block List', color: Colors.red),
                _IconButtonWithLabel(icon: Icons.delete_forever, label: 'Request Deletion', color: Colors.red),
              ],
            ),
            const SizedBox(height: 10),
            const _IconButtonWithLabel(icon: Icons.send, label: 'Customer Care', color: Colors.white),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }

  Widget _buildLabeledField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.orbitron(color: Colors.white, fontSize: 12),
          ),
          const SizedBox(height: 5),
          Container(
            height: 58,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              hint,
              style: GoogleFonts.orbitron(fontSize: 14, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class _IconButtonWithLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _IconButtonWithLabel({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 26, color: color),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: color, fontSize: 12),
        ),
      ],
    );
  }
}