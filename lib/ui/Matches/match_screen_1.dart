import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_ethan/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchScreen1 extends StatelessWidget {
  final List<Map<String, String>> matches = [
    {"name": "Aisha", "age": "24", "image": "assets/dynamic_assets/ambani.png"},
    {"name": "Sara", "age": "22", "image": "assets/dynamic_assets/Annabelle.png"},
    {"name": "Hina", "age": "26", "image": "assets/dynamic_assets/Reagan.png"},
    {"name": "Maya", "age": "25", "image": "assets/dynamic_assets/Hadley.png"},
    {"name": "Hidden", "age": "26", "image": "assets/dynamic_assets/hidden.png"},
    {"name": "Talent", "age": "25", "image": "assets/dynamic_assets/talent.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TOP ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Online count with dot
                  Row(
                    children: [
                      // Container(
                      //   width: 10,
                      //   height: 10,
                      //   decoration: BoxDecoration(
                      //     color: Colors.green,
                      //     shape: BoxShape.circle,
                      //   ),
                      // ),
                      SizedBox(width: 6),
                      Text(
                        "User Online: 345",
                        style: GoogleFonts.orbitron(fontSize: 14, color: whiteColor),
                      ),
                        SizedBox(width: 6),
                         Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  // Icon(Icons.notifications_none, size: 26, color: Colors.black),
                ],
              ),

              SizedBox(height: 12),

              // Heading
              Row(
                children: [
                  Text(
                    "Matches",
                    style: GoogleFonts.orbitron(
                      fontSize: 34,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                     
                    ),
                  ),
                  SizedBox(width: 100,),
                  Icon(
                  Icons.swap_vert,
                  color: Colors.white,
                  size: 50,
                ),
                ],
              ),

              SizedBox(height: 4),
              Text(
                "This is a list of people who have\nliked you and your matches.",
                style: GoogleFonts.orbitron(fontSize: 16, color: whiteColor),
              ),

              SizedBox(height: 12),
              Row(
                children: [
                  Container(height: 2, color: Colors.grey[300]),
                  
                ],
              ),
              SizedBox(height: 12),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: matches.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          Image.asset(
                            matches[index]["image"]!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          Positioned(
                            bottom: 8,
                            left: 8,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "${matches[index]["name"]}, ${matches[index]["age"]}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (index) {},
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart), label: "Matches"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble), label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), label: "Profile"),
        ],
      ),
    );
  }
}
