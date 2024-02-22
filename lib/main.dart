import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igs_online/home.dart';
import 'package:igs_online/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IGS Online',
      theme: ThemeData(
        textTheme: GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const halamanLogin(),
      home: const halamanHome(),
    );
  }
}

