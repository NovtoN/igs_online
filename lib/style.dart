import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//mengatur style tulisan dari header login

const TextStyle header = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.bold,
    color: Colors.amber,
    shadows: [
        Shadow(
            color: Colors.black,
            blurRadius: 20,
            offset: Offset(10.0, 2.0)
        )
    ],
);

const TextStyle header2 = TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    shadows: [
        Shadow(
            color: Colors.black,
            blurRadius: 20,
            offset: Offset(10.0, 2.0)
        )
    ],
);

const TextStyle txst_hint = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.normal,
    color: Colors.white54,
);

const TextStyle txst_input = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.normal,
    color: Colors.white,
);

const TextStyle txst_input_blue = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.normal,
    color: Colors.cyanAccent,
);

const TextStyle txst_button = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 7
);