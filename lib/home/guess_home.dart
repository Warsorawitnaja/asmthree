import 'package:asmthree/game_page/game.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Guess_home extends StatefulWidget {
  const Guess_home({Key? key}) : super(key: key);

  @override
  State<Guess_home> createState() => _Guess_homeState();
}

class _Guess_homeState extends State<Guess_home> {
  var c = " ";
  var _input = '';
  var _msg = 'ทายเลข 1 ถึง 100';
  final _game = Game();

  void handleClockGuess() {
    var guess = int.tryParse(_input);
    if (guess == null) {
      print('Error');
    } else {
      var result = _game.doGuess(guess);
      var count = _game.guessCount;
      if (result == Result.tooLow) {
        setState(() {
          _msg = "$guess : น้อยเกินไป";
          _input = "";
        });
      } else if (result == Result.tooHigh) {
        setState(() {
          _msg = "$guess : มากเกินไป";
          _input = "";
        });
      } else {
        setState(() {
          _msg = "$guess : ถูกต้อง 🎉 (ทาย $count ครั้ง)";
        });
      }
    }
  }

  Widget _buildIndicatorV2(var num) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          /// callback function , event Listenner / handler
          setState(() {
            if (num == -1) {
              _input = _input.substring(0, _input.length - 1);
            } else {
              if (_input.length < 3) {
                _input = _input + num.toString();
              }
            }
            if (num == -2) {
              _input = "";
            }
          });
        },
        customBorder: CircleBorder(),
        child: Container(
            width: 50.0,
            height: 30.0,
            //alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: num != -1 || num != -2
                  ? Border.all(
                color: Colors.black12,
                width: 1.0,
              )
                  : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    if(num == -1)
                      Icon(
                        Icons.backspace_outlined,
                        color: Colors.purple.shade400,
                      )

                    else if(num >= 0)
                      Text(
                        num.toString(),
                        style: GoogleFonts.firaCode(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple.shade400),
                      ),
                    if(num == -2)
                      Icon(
                        Icons.close,
                        color: Colors.purple.shade400,
                      )
                  ],
                ),
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GUESS THE NUMBER'),
          backgroundColor: Colors.purple,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.shade100,
                    blurRadius: 5.0,
                    //spreadRadius: 2.0,
                    offset: Offset(8.0, 8.0),
                  )
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      Padding(
                          padding: EdgeInsets.all(20),
                          child: Align(
                            child: Image.asset("assets/images/guess_logo.png",
                                width: 100),
                          )),
                      Column(
                        children: [
                          Text("GUESS",
                              style: TextStyle(
                                  fontSize: 30, color: Colors.purple.shade100)),
                          Row(
                            children: [
                              Text("THE NUMBER",
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.purple)),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(_input, style: TextStyle(fontSize: 40)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(_msg, style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        /// แนวนอน
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildIndicatorV2(1),
                          _buildIndicatorV2(2),
                          _buildIndicatorV2(3),
                        ],
                      ),
                      Row(
                        /// แนวนอน
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildIndicatorV2(4),
                          _buildIndicatorV2(5),
                          _buildIndicatorV2(6),
                        ],
                      ),
                      Row(
                        /// แนวนอน
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildIndicatorV2(7),
                          _buildIndicatorV2(8),
                          _buildIndicatorV2(9),
                        ],
                      ),
                      Row(
                        /// แนวนอน
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildIndicatorV2(-2),
                          _buildIndicatorV2(0),
                          _buildIndicatorV2(-1),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: handleClockGuess,
                            child: Text("GUESS"),
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(Colors.purple)),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              height: 600.0,
              width: 400.0,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(30),
            ),
          ],
        ));
  }
}
/*
num == -1
                        ? Icon(
                            Icons.backspace_outlined,
                            color: Colors.purple.shade400,
                          )
                        : Text(
                            num.toString(),
                            style: GoogleFonts.firaCode(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple.shade400),
                          ),
 */