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
    title: 'Welcome to\n Vocapp',
    image: 'assets/images/onboarding_gif_1.gif',
    description: 'Ever struggled with memorizing new words when studying a new language?',
  ),
  OnBoarding(
    title: 'Ai-powered studying tool',
    image: 'assets/images/onboarding_gif_2.gif',
    description: 'With tailor-made exercises,\n we will help you turn your brain on turbo mode, ',
  ),
  OnBoarding(
    title: 'Boost your Brainpower',
    image: 'assets/images/onboarding_gif_3.gif',
    description: 'Start your journey right now\nand enjoy not only the end result but the journey itself',
  ),
  // OnBoarding(
  //   title: 'Connect with your community',
  //   image: 'assets/images/onboarding_image_4.png',
  //   description: 'Hello,',
  // ),
];
