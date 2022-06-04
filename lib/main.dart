import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharehouse_app/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './pages/pages.dart';
// import 'pages/onboarding/components/page_counter.dart';

bool? seenOnboard;

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // to show status bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  // to load onboard for the first time only
  SharedPreferences pref = await SharedPreferences.getInstance();
  seenOnboard = pref.getBool('seenOnboard') ?? false; //if null set to false

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sharehouse App',
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: kScaffoldBackground,
      ),
      home: seenOnboard == true ? SignUpPage() : OnBoardingPage(),
    );
  }
}
