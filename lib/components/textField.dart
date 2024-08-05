import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    });


  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.niramit(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 12,
        )
      ),
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 217, 217, 217)),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 217, 217, 217)),
          borderRadius: BorderRadius.circular(20),
          
        ),
        fillColor: Color.fromARGB(255, 217, 217, 217),
        filled: true,
        hintText: hintText,
        
      )
    );
  }
}