import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

//https://pub.dev/packages/audioplayers

class XylophoneApp extends StatelessWidget {

  Widget build_ ({int sound, Color c}) {
    return Expanded(
      child: FlatButton(
        color: c,
        onPressed: () {
          final player = AudioCache();
          player.play('note$sound.wav');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  build_(sound : 1, c : Colors.red),
                  build_(sound : 2, c : Colors.green),
                  build_(sound : 3, c : Colors.blue),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
