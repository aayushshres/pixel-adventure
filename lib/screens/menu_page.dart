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
                      color: Colors.white,
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ],
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const GamePlay()));
                    },
                    child: const Text("Play"),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CustomButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
