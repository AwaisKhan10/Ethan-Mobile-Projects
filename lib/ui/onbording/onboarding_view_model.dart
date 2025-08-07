class OnboardingItem {
  final String image;
  final String title;
  final String subtitle;

  OnboardingItem({required this.image, required this.title, required this.subtitle});
}

class OnboardingViewModel {
  List<OnboardingItem> pages = [
    OnboardingItem(
      image: "assets/dynamic_assets/onboarding.png",
      title: "Algorithm",
      subtitle: "Users go through a vetting process to ensure your match is legit.",
    ),
    OnboardingItem(
      image: "assets/dynamic_assets/dressing.png",
      title: "Matches",
      subtitle: "We match you with people that share similar interests.",
    ),
    OnboardingItem(
      image: "assets/dynamic_assets/stylish.png",
      title: "Premium",
      subtitle: "Sign up today and enjoy the first month of premium benefits on us.",
    ),
  ];
}

// view_model/onboarding_view_model.dart
// class OnboardingModel {
//   final String image;
//   final String title;
//   final String subtitle;

//   OnboardingModel({
//     required this.image,
//     required this.title,
//     required this.subtitle,
//   });
// }

// class OnboardingViewModel {
//   final List<OnboardingModel> pages = [
//     OnboardingModel(
//       image: "assets/dynamic_assets/onboarding.png",
//       title: 'Algorithm',
//       subtitle: 'Users go through a vetting process to ensure you never match with bots.',
//     ),
//     OnboardingModel(
//       image: "assets/dynamic_assets/dressing.png",
//       title: 'Matches',
//       subtitle: 'We match you with people that have a large array of similar interests.',
//     ),
//     OnboardingModel(
//       image: "assets/dynamic_assets/stylish.png",
//       title: 'Premium',
//       subtitle: 'Sign up today and enjoy the first month of premium benefits on us.',
//     ),
//   ];
// }
