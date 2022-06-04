class OnBoarding {
  final String title;
  final String image;
  final String description;

  OnBoarding({
    required this.title,
    required this.image,
    required this.description,
  });
}

List<OnBoarding> onBoardingContents = [
  OnBoarding(
    title: 'Welcome to\n Sharehouse app',
    image: 'assets/images/onboarding_image_1.png',
    description: 'Hello,',
  ),
  OnBoarding(
    title: 'Check schedule easily',
    image: 'assets/images/onboarding_image_2.png',
    description: 'Hello,',
  ),
  OnBoarding(
    title: 'Smart home support',
    image: 'assets/images/onboarding_image_3.png',
    description: 'Hello,',
  ),
  OnBoarding(
    title: 'Connect with your community',
    image: 'assets/images/onboarding_image_4.png',
    description: 'Hello,',
  ),
];
