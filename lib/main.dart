import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(child: Keys()),
      ),
    );
  }
}

class Block extends StatelessWidget {
  final Color color;
  final int? musicId;

  const Block({super.key, required this.color, this.musicId});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: MaterialButton(
          enableFeedback: false,
            padding: EdgeInsets.zero,
            onPressed: () {
              final player = AudioPlayer();
              player.setPlayerMode(PlayerMode.lowLatency);
              player.play(AssetSource('note$musicId.wav'));
            },
            child: Container(color: color, width: double.infinity)));
  }
}

class Keys extends StatelessWidget {
  const Keys({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Block(color: Colors.red, musicId: 1),
      const Block(
        color: Colors.orange,
        musicId: 2,
      ),
      const Block(
        color: Colors.yellow,
        musicId: 3,
      ),
      const Block(
        color: Colors.green,
        musicId: 4,
      ),
      Block(
        color: Colors.green.shade600,
        musicId: 5,
      ),
      const Block(
        color: Colors.blue,
        musicId: 6,
      ),
      const Block(
        color: Colors.purple,
        musicId: 7,
      )
    ]);
  }
}
