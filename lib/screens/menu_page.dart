import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_adventure/screens/game_play.dart';
import 'package:pixel_adventure/widgets/custom_button.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Expanded(
            child: Image.asset("assets/images/menu_background.gif"),
          ),
          Expanded(
            child: Container(
              color: Colors.black.withAlpha(20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Pixel Adventure",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.micro5(
                        textStyle: const TextStyle(
                      color: Color(0xFFFCBD80),
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 3.0,
                          color: Color(0xFF451B0B),
                        ),
                        Shadow(
                          offset: Offset(3, 3),
                          blurRadius: 3.0,
                          color: Color(0xFF5D2E1C),
                        ),
                        Shadow(
                          offset: Offset(3, 3),
                          blurRadius: 3.0,
                          color: Color(0xFFB47C57),
                        ),
                      ],
                    )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      // Play Button
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const GamePlay()));
                      },
                      child: const CustomButton(
                        imagePath: "assets/images/HUD/PlayButton.png",
                      ),
                    ),
                    GestureDetector(
                      // Options Button
                      onTap: () {
                        // Navigate to settings
                      },
                      child: const CustomButton(
                        imagePath: "assets/images/HUD/OptionsButton.png",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      // Help Button
                      onTap: () {
                        // Navigate to help
                      },
                      child: const CustomButton(
                        imagePath: "assets/images/HUD/HelpButton.png",
                      ),
                    ),
                    GestureDetector(
                      // About Button
                      onTap: () {
                        // Navigate to about
                      },
                      child: const CustomButton(
                        imagePath: "assets/images/HUD/AboutButton.png",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
