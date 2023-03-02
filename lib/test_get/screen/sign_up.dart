import 'package:flutter/material.dart';
import 'package:getx_1/test_get/components/custom_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/shop.png'),
            )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
              color: Colors.white,
              child: SingleChildScrollView(
                child: Container(
                  width: 400,
                  height: 600,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create Account',
                        style: TextStyle(
                            fontFamily: GoogleFonts.wendyOne().fontFamily,
                            fontSize: 50),
                      ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // Text(
                      //   'Please sign in to continue',
                      //   style: TextStyle(
                      //       fontFamily: GoogleFonts.wendyOne().fontFamily,
                      //       fontSize: 20,
                      //       color: Colors.grey),
                      // ),
                      const SizedBox(
                        height: 30,
                      ),
                      const CustomInputText(
                        icon: Icons.person_outline,
                        label: 'USERNAME',
                        isPassword: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomInputText(
                        icon: Icons.person_outline,
                        label: 'EMAIL',
                        isPassword: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomInputText(
                        icon: Icons.lock_outline,
                        label: 'CONFIRM PASSWORD',
                        isPassword: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomInputText(
                        icon: Icons.lock_outline,
                        label: 'PASSWORD',
                        isPassword: true,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'You already have an account. Sign in right here',
                                style: TextStyle(
                                  fontFamily: GoogleFonts.wendyOne().fontFamily,
                                ),
                              ),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      padding: const EdgeInsets.all(0)),
                                  onPressed: () {},
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.wendyOne().fontFamily,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                shape: const StadiumBorder(),
                              ),
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily:
                                        GoogleFonts.wendyOne().fontFamily,
                                  ),
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
