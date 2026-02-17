import 'package:flutter/material.dart';
import 'player_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> musiques = const [
    {
      "titre": "Lou",
      "artiste": "The Weeknd",
      "image":
          "https://png.pngtree.com/thumb_back/fh260/background/20240522/pngtree-abstract-cloudy-background-beautiful-natural-streaks-of-sky-and-clouds-red-image_15684333.jpg",
    },
    {
      "titre": "La",
      "artiste": "Daft Punk",
      "image":
          "https://png.pngtree.com/thumb_back/fh260/background/20240522/pngtree-abstract-cloudy-background-beautiful-natural-streaks-of-sky-and-clouds-red-image_15684333.jpg",
    },
    {
      "titre": "Nullosse",
      "artiste": "Eminem",
      "image":
          "https://png.pngtree.com/thumb_back/fh260/background/20240522/pngtree-abstract-cloudy-background-beautiful-natural-streaks-of-sky-and-clouds-red-image_15684333.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Music App")),
      body: ListView.builder(
        itemCount: musiques.length,
        itemBuilder: (context, index) {
          final musique = musiques[index];

          return ListTile(
            leading: Image.network(musique["image"]!),
            title: Text(musique["titre"]!),
            subtitle: Text(musique["artiste"]!),
            trailing: const Icon(Icons.play_arrow),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlayerPage(musique: musique),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
