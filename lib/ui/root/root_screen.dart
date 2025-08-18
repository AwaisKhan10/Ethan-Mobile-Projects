import 'package:flutter/material.dart';
import 'package:flutter_application_ethan/core/constants/colors.dart';
import 'package:flutter_application_ethan/core/constants/strings.dart';
import 'package:flutter_application_ethan/ui/root/root_view_model.dart';

import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {
  final int? selectedScreen;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  RootScreen({super.key, this.selectedScreen = 0});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RootViewModel(initialIndex: selectedScreen ?? 0),
      child: Consumer<RootViewModel>(
        builder: (context, model, child) => Scaffold(
          key: _scaffoldKey,
          backgroundColor: whiteColor,

          ///
          /// Start Body
          ///
          body: model.rootScreens[model.currentIndex],

          ///
          /// BottomBar
          ///
          bottomNavigationBar: Container(
            width: double.infinity,
            height: 80,
            padding: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(color: whiteColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    model.updateIndex(0);
                  },
                  child: Image.asset(
                    "$iconsAssets/cards.png",
                    scale: 3,
                    color: model.currentIndex != 0
                        ? Color(0xffADAFBB)
                        : Color(0xff581C87),
                  ),
                ),
                // model.currentIndex != 1
                //     ? GestureDetector(
                //         onTap: () {
                //           model.updateIndex(1);
                //         },
                //         child: Image.asset("$iconsAssets/like.png", scale: 3),
                //       )
                //     : Image.asset("$iconsAssets/indicator.png", scale: 3),
                GestureDetector(
                  onTap: () {
                    model.updateIndex(1);
                  },
                  child: Image.asset(
                    "$iconsAssets/message.png",
                    scale: 3,
                    color: model.currentIndex != 1
                        ? Color(0xffADAFBB)
                        : Color(0xff581C87),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    model.updateIndex(2);
                  },
                  child: Image.asset(
                    "$iconsAssets/people.png",
                    scale: 3,
                    color: model.currentIndex != 2
                        ? Color(0xffADAFBB)
                        : Color(0xff581C87),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
