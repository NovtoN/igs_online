import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igs_online/register.dart';
import 'package:igs_online/widgets/backgroundImage.dart';

class halamanHome extends StatefulWidget {
  const halamanHome ({super.key});

  @override
  State<halamanHome> createState() => _halamanHomeState();

}

class _halamanHomeState extends State<halamanHome> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroundImage(),
        Scaffold()
      ],
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}
