import 'package:flutter/material.dart';

class PlayerPagetest extends StatefulWidget {
  final Map<String, String> musique;

  const PlayerPagetest({super.key, required this.musique});

  @override
  State<PlayerPagetest> createState() => _PlayerPagetestState();
}

class _PlayerPagetestState extends State<PlayerPagetest> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lecture test")),
      body: Center(
        child: Column(
          children: [
            Image.network(widget.musique["image"]!),
            Text(widget.musique["titre"]!),
            Text(widget.musique["artiste"]!),
            ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(title: Text("Élément $index"));
              },
            ),
          ],
        ),
      ),
    );
  }
}
