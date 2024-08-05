import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsletter_app/components/textField.dart';
import 'package:newsletter_app/components/button.dart';

class SigninPage extends StatefulWidget {
  final Function() ? onTap;

  const SigninPage({super.key, required this.onTap});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailTextController.text, 
      password: passwordTextController.text,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 86.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  const ImageIcon(
                    AssetImage('assets/icons/padlock.png'),
                    color: Colors.black,
                    size: 50,
                  ),

                  Text(
                    'Sign in',
                    style: GoogleFonts.niramit(
                      textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'Sign in to share your news!',
                    style: GoogleFonts.niramit(
                      textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 21.0),

                  MyTextField(
                    controller: emailTextController, 
                    hintText: 'Email', 
                    obscureText: false,
                  ),
                  
                  SizedBox(height: 21.0),

                  MyTextField(
                    controller: passwordTextController, 
                    hintText: 'Password', 
                    obscureText: true,
                  ),

                  SizedBox(height: 30),

                  MyButton(
                    onTap: signIn,
                    text: 'Sign in',
                  ),

                  const Divider(
                    thickness: 1,
                    color: Colors.black,
                    height: 60,
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '''Don't have an account?''',
                        style: GoogleFonts.niramit(
                          fontSize: 12,
                        ),
                      ),

                      const SizedBox(width: 4),

                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          'Register here',
                          style: GoogleFonts.niramit(
                            fontSize: 12,
                            color: Colors.blue,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      )
                  ]
                ,)
              ],
            )
          )
        )
      ),
    );
  }
}