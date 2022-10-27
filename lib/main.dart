import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vocapp/pages/authentication/login_page.dart';
import 'package:vocapp/pages/books/providers/cover_style.dart';
import 'package:vocapp/pages/onboarding/onboarding_page.dart';
import 'package:vocapp/pages/home/home_page.dart';
import 'package:vocapp/size_configs.dart';
import 'package:vocapp/styles.dart';
import 'package:vocapp/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // to show status bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  // to load onboard for the first time only
  SharedPreferences pref = await SharedPreferences.getInstance();
  globals.seenOnboard =
      await pref.getBool('seenOnboard') ?? false; //if null set to false

  init_globals();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CoverStyle()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      // to change safe area insets bar color
      value: SystemUiOverlayStyle(
        statusBarColor: kScaffoldBackground, //top status bar
        systemNavigationBarColor: kScaffoldBackground, //bottom bar
        statusBarIconBrightness: Brightness.dark, // status bar icons' color
        systemNavigationBarIconBrightness:
            Brightness.dark, //navigation bar icons' color
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Vocapp',
        theme: ThemeData(
          textTheme: GoogleFonts.manropeTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: kScaffoldBackground,
        ),
        routes: {
          '/': (context) => HomePage(),
          '/onBoarding': (context) => OnBoardingPage(),
          '/login': (context) => LoginPage(),
        },
        // initialRoute: seenOnboard == false
        //     ? '/onBoarding' : '/login',
        initialRoute: '/',
      ),
    );
  }
}

void init_globals() {
  // to load global variables
  globals.library_edit_mode = 1;
}
