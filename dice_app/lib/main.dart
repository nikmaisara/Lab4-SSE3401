import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
//import 'package:audioplayers/audio_cache.dart';
import 'dart:math';

//class MyAudioPlayer {
  //void setAsset(String asset) {
    // Method implementation
  //}
//}


//class MyAudioPlayer {
  //AudioCache _audioCache = AudioCache();

  //Future<void> play(String asset) async {
    //await _audioCache.play(asset);
  //}
//}

void main() {
  runApp(MaterialApp(
    home: Scaffold(appBar: AppBar(title: Text('Twin Dice Game'),
    backgroundColor: Color.fromARGB(255, 243, 111, 155),
    ),
    body: DiceGame(),
    ),
  ));
}
 
class DiceGame extends StatefulWidget {
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  int leftdice = 1;
  int rightdice = 2;
  //MyAudioPlayer _audioPlayer = MyAudioPlayer();
  //@override
  //void initState() {
    //super.initState();
    //_audioPlayer.setAsset('audios/629982__flem0527__dice-rolling-on-table.wav');
  //}
  //MyAudioPlayer _audioPlayer = MyAudioPlayer();
  AudioCache audioCache = AudioCache();

@override
void initState() {
  super.initState();
  audioCache.load('dice_roll.mp3');
}


  //void playSound() async {
    //await AudioPlayer().play('audios/629982__flem0527__dice-rolling-on-table.wav'); // Play the sound file
  //}
  //Future<void> playSound() async {
  //void playSound() async {
    //await audioCache.play('dicerolling.mp3');
  //}

  void playSound() async {
    audioCache.play('dice_roll.mp3');
  }

  //rolldices() {
    //setState(() {
      //leftdice = Random().nextInt(6) + 1;
      //rightdice = Random().nextInt(6) + 1;
    //});
    //playSound(); // Call the playSound() function to play the sound
  //}
 void rolldices() {
  audioCache.play('dice_roll.mp3');
  setState(() {
    leftdice = Random().nextInt(6) + 1;
    rightdice = Random().nextInt(6) + 1;
  });
}
  @override
  Widget build (BuildContext context) {
    return Column (
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Image.asset('assets/rolling_dice.png'),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Image.asset('assets/$leftdice.png'),
                ),
              ),
              SizedBox(width: 16.0),
                Expanded(
                  child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Image.asset('assets/$rightdice.png'),
                  ),
                ),
            ],
          )
        ),
        Center(
          child: Column(
          children: [
            SizedBox(height: 200), // Add this SizedBox widget
            ElevatedButton(
              onPressed: () {
                rolldices();
              },
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all<TextStyle>(
                  GoogleFonts.lobster(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                minimumSize: MaterialStateProperty.all<Size>(
                  Size(170, 70),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 243, 111, 155),
                ),
              ),
              child: Text('Roll Dices'),
            ),
          ],
          ),
        ),
      ],
    );
  }
}