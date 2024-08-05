import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsletter_app/components/textField.dart';

import 'package:newsletter_app/components/button.dart';

class RegisterPage extends StatefulWidget {
  final Function() ? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  void signUp() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    if (passwordTextController.text != confirmPasswordTextController.text) {
      Navigator.pop(context);
      displayMessage("Passwords don't match.");
      return;
    }

    // try to create user
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailTextController.text, password: passwordTextController.text);

      if (context.mounted) Navigator.pop(context);

    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessage(e.code);
    }
  }

  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      )
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
                    'Sign up',
                    style: GoogleFonts.niramit(
                      textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    '''Let's get you started with an account''',
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

                  SizedBox(height: 21.0),

                  MyTextField(
                    controller: confirmPasswordTextController, 
                    hintText: 'Re-type Password', 
                    obscureText: true,
                  ),

                  SizedBox(height: 40),

                  MyButton(
                    onTap: signUp,
                    text: 'Sign up',
                  ),

                  const Divider(
                    thickness: 1,
                    color: Colors.black,
                    height: 50,
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '''Already have an account?''',
                        style: GoogleFonts.niramit(
                          fontSize: 12,
                        ),
                      ),

                      const SizedBox(width: 4),

                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          'Login here',
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