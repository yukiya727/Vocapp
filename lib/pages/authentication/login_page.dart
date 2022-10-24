import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocapp/pages/authentication/sign_up_page.dart';
import '../../styles.dart';
import '../../size_configs.dart';
import '../../validators.dart';
import '../../widgets/widgets.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginKey = GlobalKey<FormState>();

  void onSubmit() {
    if (_loginKey.currentState!.validate()) {
      _loginKey.currentState!.save();
      Navigator.pushNamed(context, '/home');
    }
  }

  List<FocusNode> _loginFocusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  setSeenOnboard() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('seenOnboard', true);
  }

  @override
  void initState() {
    super.initState();
    setSeenOnboard();
    _loginFocusNodes.forEach((element) {
      element.addListener(() {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    // double screenRatio = SizeConfig.screenRatio!;
    double extraSpace =
        (SizeConfig.screenWidth! - SizeConfig.screenHeight!) / 2;
    double extraPaddingH = extraSpace > 0 ? extraSpace : 0;

    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: extraPaddingH + 60,
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset(
                                'assets/images/auth/sign_up.gif',
                              ),
                            ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Välkommen!',
                                style: kTitle2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: extraPaddingH + 60),
                        child: Form(
                          key: _loginKey,
                          child: Column(
                            crossAxisAlignment:  CrossAxisAlignment.stretch,
                            children: [
                              MyTextFormField(
                                hint: 'Email',
                                icon: Icons.email_outlined,
                                fillColor: kTextFieldBackground,
                                inputType: TextInputType.emailAddress,
                                inputAction: TextInputAction.next,
                                focusNode: _loginFocusNodes[0],
                                validator: emailValidator,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              MyPasswordField(
                                fillColor: kTextFieldBackground,
                                focusNode: _loginFocusNodes[1],
                                validator: passwordValidator,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: MainTextButton(
                                      buttonName: 'Log in',
                                      onPressed: onSubmit,
                                      bgColor: kPrimaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: (width - extraPaddingH) * 0.02,
                                  ),
                                  Expanded(
                                    child: MainTextButton(
                                      buttonName: 'Sign up',
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpPage(),
                                          ),
                                        );
                                      },
                                      bgColor: kPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ForgotPasswordPage()));
                        },
                        child: Text(
                          'Ooh, I Forgot my Password?',
                          style: kBodyText3.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // sign iup with google
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: extraPaddingH + 60),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MainIconTextButton(
                              buttonName: "Sign in with Google",
                              buttonTextColor: kButtonTextColor,
                              buttonIconPath:
                                  "assets/images/white-google-logo.png",
                              onPressed: () {},
                              bgColor: Color(0xFFde5246),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            MainIconTextButton(
                              buttonName: "Sign in with Apple",
                              buttonTextColor: kButtonTextColor,
                              buttonIconPath:
                                  "assets/images/apple_logo.png",
                              onPressed: () {},
                              bgColor: Color(0xFF000000),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
