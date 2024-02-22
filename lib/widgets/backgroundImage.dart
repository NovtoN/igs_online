

import 'package:flutter/material.dart';

class backgroundImage extends StatelessWidget {
  const backgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [Colors.black, Colors.black54],
        begin: Alignment.bottomRight,     //mengatur arah gradient
        end: Alignment.center,
      ).createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg_igs.png"), //wajib ditambahkan flutter assets di pubspec.yaml
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54,
                BlendMode.lighten
            ),
          ),
        ),

      ),
    );
  }
}
