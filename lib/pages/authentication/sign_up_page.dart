import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../styles.dart';
import '../../main.dart';
import '../../size_configs.dart';
import '../../validators.dart';
import '../../widgets/widgets.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _signUpKey = GlobalKey<FormState>();

  void onSubmit() {
    _signUpKey.currentState!.validate();
  }

  List<FocusNode> _signUpFocusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    super.initState();
    // setSeenonboard();
    _signUpFocusNodes.forEach((element) {
      element.addListener(() {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.blockSizeV;
    double extraSpace =
        (SizeConfig.screenWidth - SizeConfig.screenHeight) / 2;
    double extraPaddingH = extraSpace > 0 ? extraSpace : 0;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: extraPaddingH + 60),
          child:
          Column(
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        child:
                        Image.asset(
                            'assets/images/auth/sign_up.gif'),
                      ),
                    ),
                    // SizedBox(
                    //   height: height * 2,
                    // ),
                    Text(
                      'Create Your Account',
                      style: kTitle2,
                    ),
                    SizedBox(
                      height: height * 2,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Form(
                      key: _signUpKey,
                      child: Column(
                        children: [
                          // MyTextFormField(
                          //   fillColor: Colors.white,
                          //   hint: 'Name',
                          //   icon: Icons.person,
                          //   inputAction: TextInputAction.next,
                          //   inputType: TextInputType.name,
                          //   focusNode: _signUpFocusNodes[0],
                          //   validator: nameValidator,
                          // ),
                          MyTextFormField(
                              hint: 'Email',
                              icon: Icons.email_outlined,
                              fillColor: kTextFieldBackground,
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                              focusNode: _signUpFocusNodes[0],
                              validator: emailValidator),
                          MyPasswordField(
                            fillColor: kTextFieldBackground,
                            focusNode: _signUpFocusNodes[1],
                            validator: passwordValidator,
                          ),
                          MyCheckBox(
                            text: 'Keep me signed in',
                          ),
                          // MyCheckBox(
                          //   text: 'Email me about special pricing and more',
                          // ),
                          MainTextButton(
                            buttonName: ' Create Account & Sign In ',
                            onPressed: onSubmit,
                            bgColor: kPrimaryColor,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              height: 3,
                              color: kSecondaryColor.withOpacity(0.4),
                            ),
                          ),
                          Text(
                            '  Or sign up with  ',
                            style: kBodyText3,
                          ),
                          Expanded(
                            child: Divider(
                              height: 3,
                              color: kSecondaryColor.withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child:
                          MainIconTextButton(
                            buttonName: "Apple",
                            buttonTextColor: kButtonTextColor,
                            buttonIconPath:
                            "assets/images/apple_logo.png",
                            onPressed: () {},
                            bgColor: Color(0xFF000000),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child:
                            MainIconTextButton(
                              buttonName: "Google",
                              buttonTextColor: kButtonTextColor,
                              buttonIconPath:
                              "assets/images/white-google-logo.png",
                              onPressed: () {},
                              bgColor: Color(0xFFde5246),
                            ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: kBodyText3,
                        ),
                        SmallTextButton(
                          buttonText: 'Sign in',
                          onPressed: ()
                        {Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        );}

                          ,
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
