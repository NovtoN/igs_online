import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../style.dart';

class StyleButton extends StatelessWidget {
  const StyleButton({
    super.key, required this.textButton, required this.buttonColor,
  });

  final String textButton;
  final Color buttonColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,   //mengatur lebar area button
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(16)
      ),
      child: TextButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context)  {
                  return AlertDialog(
                    title: Text("Daftar Akun"),
                    content: Text("Silahkan Daftar AKun"),
                  );
            });
          },
          child: Text(
            textButton,
            style: GoogleFonts.bebasNeue(
                textStyle: txst_button
            ),
          )
      ),
    );
  }
}

