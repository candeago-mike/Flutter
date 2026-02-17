import 'package:flutter/material.dart';

class PlayerPage extends StatefulWidget {
  final Map<String, String> musique;

  const PlayerPage({super.key, required this.musique});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lecture")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(widget.musique["image"]!),
            const SizedBox(height: 20),
            Text(
              widget.musique["titre"]!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.musique["artiste"]!,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            IconButton(
              iconSize: 80,
              icon: Icon(isPlaying ? Icons.pause_circle : Icons.play_circle),
              onPressed: () {
                setState(() {
                  isPlaying = !isPlaying;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
