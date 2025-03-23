import 'dart:js_interop';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(home: Mainpage()));
}

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          color: Colors.blueAccent,
          height: MediaQuery.of(context).size.height / 2,
          width: double.infinity,
          child: Center(
            child: MaterialButton(
              color: Colors.white,
              shape: const CircleBorder(),
              height: 100,
              minWidth: 100,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Gamepage(),
                    ));
              },
              child: const Text("START"),
            ),
          ),
        ),
        Container(
          color: Colors.redAccent,
          height: MediaQuery.of(context).size.height / 2,
          width: double.infinity,
          child: Center(
            child: MaterialButton(
              color: Colors.white,
              shape: const CircleBorder(),
              height: 100,
              minWidth: 100,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Gamepage(),
                    ));
              },
              child: const Text("START"),
            ),
          ),
        )
      ],
    ));
  }
}

class Gamepage extends StatefulWidget {
  const Gamepage({super.key});

  @override
  State<Gamepage> createState() => _GamepageState();
}

class _GamepageState extends State<Gamepage> {
  double bluecardheight = 0;
  double redcardheight = 0;

  int playerAscore = 0;
  int playerBscore = 0;

  bool initilaized = false;

  @override
  Widget build(BuildContext context) {
    print("BUILD FUNCTION CALLED");
    print(initilaized);

    if (initilaized == false) {
      bluecardheight = MediaQuery.of(context).size.height / 2;
      redcardheight = MediaQuery.of(context).size.height / 2;

      initilaized = true;
    }

    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              print(bluecardheight);

              setState(() {
                bluecardheight = bluecardheight + 30;
                redcardheight = redcardheight - 30;
                playerBscore = playerBscore + 5;
              });
              double winningheight = MediaQuery.of(context).size.height - 60;
              print(bluecardheight);
              print(winningheight);

              if (bluecardheight > winningheight) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => resultpage(playerBscore, "B")));
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              width: double.infinity,
              height: bluecardheight,
              color: Colors.blueAccent,
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Player B",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(playerBscore.toString(),
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                redcardheight = redcardheight + 30;
                bluecardheight = bluecardheight - 30;
                playerAscore = playerAscore + 5;
              });
              double screenheight = MediaQuery.of(context).size.height;
              double winningheight = MediaQuery.of(context).size.height - 60;

              print(redcardheight);
              print(winningheight);

              if (redcardheight > winningheight) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => resultpage(playerAscore, "a"),
                    ));
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              width: double.infinity,
              height: redcardheight,
              color: Colors.redAccent,
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Player A",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(playerAscore.toString(),
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class resultpage extends StatelessWidget {
  int score = 0;
  String player = "";
  resultpage(this.score, this.player);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: player == "A" ? Colors.redAccent : Colors.blueAccent,
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                score.toString(),
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
              Text(
                player == "A" ? "Player A Won" : "Player B Won",
                style: TextStyle(fontSize: 35),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                color: Colors.white,
                child: Text("Restart Game"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
