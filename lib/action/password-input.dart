import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../style.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    super.key,
    required this.passwordCtrl,
    required this.hide, required this.icon, required this.hint, required this.inputType, required this.inputAction,
  });

  final TextEditingController passwordCtrl;
  final bool hide;
  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;



  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: passwordCtrl,
        obscureText: hide,        //mengatur ketikkan password
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
                  vertical: 10  //mengatur padding icon gembok
              ),
              child: Icon(
                icon,
                color: Colors.white,size: 25,),
            ),

            filled: true,
          // icon show password

        ),
        style: txst_input,
        keyboardType: inputType,
        textInputAction: inputAction,
      ),
    );
  }


}

