import 'package:flutter/material.dart';
import 'package:flutter_application_ethan/core/view_model/base_view_model.dart';
import 'package:flutter_application_ethan/ui/Matches/match_screen_1.dart';
import 'package:flutter_application_ethan/ui/card/card_screen.dart';
import 'package:flutter_application_ethan/ui/messages/message_screen.dart';
import 'package:flutter_application_ethan/ui/profile/final_profile_screen.dart';

class RootViewModel extends BaseViewModel {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  RootViewModel({int initialIndex = 0}) : _currentIndex = initialIndex;
  void updateIndex(int newIndex) {
    // setState(ViewState.busy);
    _currentIndex = newIndex;
    // setState(ViewState.idle);
    notifyListeners();
  }

  final List<Widget> rootScreens = [
    // DiscoverScreen(),
    MatchScreen1(),
    MessagesScreen(),
    FinalProfileScreen(),
  ];
}
