import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../style.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    required this.usernameCtrl, required this.icon, required this.hint, required this.inputType, required this.inputAction,
  });

  final TextEditingController usernameCtrl;
  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: usernameCtrl,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
                vertical: 25  //mengatur padding tulisan dalam inputbox
            ),
            fillColor: Colors.grey.withOpacity(0.3),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(style: BorderStyle.none)
            ),
            hintText: hint,
            hintStyle: txst_hint,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 10  //mengatur padding icon email
              ),
              child: Icon(
                icon,
                color: Colors.white,size: 25,),
            ),

            filled: true
        ),
        style: txst_input,
        keyboardType: inputType,
        textInputAction: inputAction,
      ),
    );
  }
}

